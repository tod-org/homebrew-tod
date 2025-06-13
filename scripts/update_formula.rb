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

formula.gsub!(/url ".*darwin-amd64\.tar\.gz"/, "url \"#{base_url}/tod-#{version}-darwin-amd64.tar.gz\"")
formula.gsub!(/sha256 "[a-f0-9]{64}"/, "sha256 \"#{sha256s["mac_intel"]}\"")

formula.gsub!(/url ".*darwin-arm64\.tar\.gz"/, "url \"#{base_url}/tod-#{version}-darwin-arm64.tar.gz\"")
formula.gsub!(/sha256 "[a-f0-9]{64}"/, "sha256 \"#{sha256s["mac_arm"]}\"")

formula.gsub!(/url ".*linux-amd64\.tar\.gz"/, "url \"#{base_url}/tod-#{version}-linux-amd64.tar.gz\"")
formula.gsub!(/sha256 "[a-f0-9]{64}"/, "sha256 \"#{sha256s["linux_intel"]}\"")

formula.gsub!(/url ".*linux-arm64\.tar\.gz"/, "url \"#{base_url}/tod-#{version}-linux-arm64.tar.gz\"")
formula.gsub!(/sha256 "[a-f0-9]{64}"/, "sha256 \"#{sha256s["linux_arm"]}\"")

File.write(formula_path, formula)
puts "✅ Updated #{formula_path} for v#{version}"
