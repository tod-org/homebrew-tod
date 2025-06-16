require "digest"
require "open-uri"

version = ARGV[0] or abort("Usage: ruby update_formula.rb <version> (e.g. 0.8.0)")
tag = "v#{version}"
base_url = "https://github.com/alanvardy/tod/releases/download/#{tag}"

platforms = {
  "mac_intel"   => "tod-#{version}-darwin-amd64.tar.gz",
  "mac_arm"     => "tod-#{version}-darwin-arm64.tar.gz",
  "linux_intel" => "tod-#{version}-linux-amd64.tar.gz",
  "linux_arm"   => "tod-#{version}-linux-arm64.tar.gz"
}

sha256s = {}

# Download and compute SHA256
platforms.each do |key, filename|
  url = "#{base_url}/#{filename}"
  puts "🔽 Downloading #{url}..."
  file = URI.open(url).read
  sha256s[key] = Digest::SHA256.hexdigest(file)
end

formula_path = "Formula/tod.rb"
formula = File.read(formula_path)

# Update version
formula.gsub!(/version\s+"[^"]+"/, "version \"#{version}\"")

# Replace SHA after matching URL
def replace_sha(formula, platform_key, filename, new_sha)
  url_regex = /url\s+"[^"]*#{Regexp.escape(filename)}"/
  sha_regex = /sha256\s+"[a-f0-9]{64}"/

  url_match = formula.match(url_regex)
  if url_match
    sha_match = formula.match(sha_regex, url_match.end(0))
    if sha_match
      old_sha = sha_match[0].match(/"([a-f0-9]{64})"/)[1]
      puts "🔁 Replacing #{platform_key} SHA:"
      puts "   Old: #{old_sha}"
      puts "   New: #{new_sha}"
      formula[sha_match.begin(0)...sha_match.end(0)] = "sha256 \"#{new_sha}\""
    else
      puts "⚠️  SHA256 not found after URL for #{platform_key}"
    end
  else
    puts "⚠️  URL not found for #{platform_key}"
  end
end

# Perform replacements
replace_sha(formula, "mac_intel",   platforms["mac_intel"],   sha256s["mac_intel"])
replace_sha(formula, "mac_arm",     platforms["mac_arm"],     sha256s["mac_arm"])
replace_sha(formula, "linux_intel", platforms["linux_intel"], sha256s["linux_intel"])
replace_sha(formula, "linux_arm",   platforms["linux_arm"],   sha256s["linux_arm"])

# Write changes
File.write(formula_path, formula)
puts "✅ Updated #{formula_path} for v#{version}"
