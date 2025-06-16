require "digest"
require "open-uri"

version = ARGV[0] or abort("Usage: ruby update_formula.rb <version> (e.g. 0.8.0)")
tag = "v#{version}"
base_url = "https://github.com/stacksjb/tod-dev/releases/download/#{tag}"

platforms = {
  "mac_intel"   => "tod-#{version}-darwin-amd64.tar.gz",
  "mac_arm"     => "tod-#{version}-darwin-arm64.tar.gz",
  "linux_intel" => "tod-#{version}-linux-amd64.tar.gz",
  "linux_arm"   => "tod-#{version}-linux-arm64.tar.gz"
}

sha256s = {}

platforms.each do |key, filename|
  url = "#{base_url}/#{filename}"
  puts "🔽 Downloading #{url}..."
  file = URI.open(url).read
  sha256s[key] = Digest::SHA256.hexdigest(file)
end

formula_path = "Formula/tod.rb"
formula = File.read(formula_path)

formula.gsub!(/version\s+"[^"]+"/, "version \"#{version}\"")

def replace_sha(formula, platform_key, regex_url, regex_sha, url, new_sha)
  old_sha = formula[regex_sha]&.match(/sha256\s+"([a-f0-9]{64})"/)&.captures&.first
  puts "🔁 Replacing #{platform_key} SHA:"
  puts "   Old: #{old_sha || 'Not found'}"
  puts "   New: #{new_sha}"
  formula.gsub!(regex_url, "url \"#{url}\"")
  formula.gsub!(regex_sha, "sha256 \"#{new_sha}\"")
end

replace_sha(formula, "mac_intel",
            /url ".*darwin-amd64\.tar\.gz"/,
            /sha256 "[a-f0-9]{64}"/,
            "#{base_url}/tod-#{version}-darwin-amd64.tar.gz",
            sha256s["mac_intel"])

replace_sha(formula, "mac_arm",
            /url ".*darwin-arm64\.tar\.gz"/,
            /sha256 "[a-f0-9]{64}"/,
            "#{base_url}/tod-#{version}-darwin-arm64.tar.gz",
            sha256s["mac_arm"])

replace_sha(formula, "linux_intel",
            /url ".*linux-amd64\.tar\.gz"/,
            /sha256 "[a-f0-9]{64}"/,
            "#{base_url}/tod-#{version}-linux-amd64.tar.gz",
            sha256s["linux_intel"])

replace_sha(formula, "linux_arm",
            /url ".*linux-arm64\.tar\.gz"/,
            /sha256 "[a-f0-9]{64}"/,
            "#{base_url}/tod-#{version}-linux-arm64.tar.gz",
            sha256s["linux_arm"])

File.write(formula_path, formula)
puts "✅ Updated #{formula_path} for v#{version}"
