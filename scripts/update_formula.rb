#!/usr/bin/env ruby
# frozen_string_literal: true

require "digest"
require "net/http"
require "uri"

version = ARGV[0] or abort("Usage: ruby update_formula.rb <version> (e.g. 0.8.0)")
tag = "v#{version}"
base_url = "https://github.com/tod-org/tod/releases/download/#{tag}"

platforms = {
  mac_arm:     "tod-#{version}-darwin-arm64.tar.gz",
  mac_intel:   "tod-#{version}-darwin-amd64.tar.gz",
  linux_arm:   "tod-#{version}-linux-arm64.tar.gz",
  linux_intel: "tod-#{version}-linux-amd64.tar.gz"
}

# --- secure, streamed hashing with redirects ---
ALLOWED_HOSTS = %w[
  github.com
  objects.githubusercontent.com
  github-releases.githubusercontent.com
].freeze
MAX_REDIRECTS = 5
SIZE_CAP_BYTES = 300 * 1024 * 1024 # 300 MB safety cap

def sha256_for(url, redirects_left: MAX_REDIRECTS)
  raise "Too many redirects for #{url}" if redirects_left <= 0

  uri = URI(url)
  unless ALLOWED_HOSTS.include?(uri.host)
    raise "Blocked host #{uri.host} for #{url}"
  end

  Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") do |http|
    req = Net::HTTP::Get.new(uri)
    req["User-Agent"] = "tod-formula-updater"
    http.request(req) do |res|
      case res
      when Net::HTTPRedirection
        loc = res["location"] or raise "Redirect without Location for #{url}"
        return sha256_for(loc, redirects_left: redirects_left - 1)
      when Net::HTTPSuccess
        digest = Digest::SHA256.new
        total = 0
        res.read_body do |chunk|
          total += chunk.bytesize
          raise "Download exceeds cap (#{SIZE_CAP_BYTES} bytes) for #{url}" if total > SIZE_CAP_BYTES
          digest.update(chunk)
        end
        return digest.hexdigest
      else
        raise "HTTP #{res.code} for #{url}"
      end
    end
  end
end

# --- download & hash each artifact ---
sha256s = {}
platforms.each do |key, filename|
  url = "#{base_url}/#{filename}"
  begin
    puts "🔽 Downloading #{url}..."
    sha = sha256_for(url)
    sha256s[key] = sha
    puts "✅ SHA256 for #{key}: #{sha}"
  rescue => e
    warn "❌ Failed to download or hash #{url}: #{e.message}"
    exit 1
  end
end

# --- update formula file ---
formula_path = "Formula/tod.rb"
formula = File.read(formula_path)

failures = []

old_version = formula[/version\s+"([^"]+)"/, 1]
if old_version == version
  puts "ℹ️ Version remains unchanged at #{version}"
else
  puts "🔄 Updating version: #{old_version} → #{version}"
end
formula.gsub!(/version\s+"[^"]+"/, "version \"#{version}\"")

def replace_platform_block(formula, platform_key, filename, new_sha, version, failures)
  pattern, label = case platform_key
  when :mac_arm     then [/on_macos.*?on_arm.*?\n(.*?)url\s+"[^"]+"\n\s+sha256\s+"[0-9a-f]{64}"/m, "macOS ARM"]
  when :mac_intel   then [/on_macos.*?on_intel.*?\n(.*?)url\s+"[^"]+"\n\s+sha256\s+"[0-9a-f]{64}"/m, "macOS Intel"]
  when :linux_arm   then [/on_linux.*?on_arm.*?\n(.*?)url\s+"[^"]+"\n\s+sha256\s+"[0-9a-f]{64}"/m, "Linux ARM"]
  when :linux_intel then [/on_linux.*?on_intel.*?\n(.*?)url\s+"[^"]+"\n\s+sha256\s+"[0-9a-f]{64}"/m, "Linux Intel"]
  end

  new_url = "url \"https://github.com/tod-org/tod/releases/download/v#{version}/#{filename}\""
  new_sha_line = "sha256 \"#{new_sha}\""

  updated = formula.sub(pattern) { |block|
    block.gsub(/url\s+"[^"]+"/, new_url)
         .gsub(/sha256\s+"[0-9a-f]{64}"/, new_sha_line)
  }

  if updated == formula
    warn "❌ Could not find or replace block for #{label}"
    failures << label
  else
    puts "✅ Updated #{label} block"
    formula.replace(updated)
  end
end

platforms.each do |key, filename|
  replace_platform_block(formula, key, filename, sha256s[key], version, failures)
end

if failures.any?
  warn "\n❌ The following blocks failed to update: #{failures.join(', ')}"
  exit 1
end

File.write(formula_path, formula)
puts "\n✅ All platform blocks updated successfully"
puts "📄 Wrote updated Formula/tod.rb for v#{version}"
