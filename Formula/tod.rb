class Tod < Formula
  desc "Unofficial Todoist command-line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  version "0.8.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/alanvardy/tod/releases/download/v0.8.0/tod-v0.8.0-macOS-x86_64.tar.gz"
      sha256 "6426123783822ea7a8a3e790e66113b98182ecc7b7a514175593b89771ee9ace"
    elsif Hardware::CPU.arm?
      url "https://github.com/alanvardy/tod/releases/download/v0.8.0/tod-v0.8.0-macOS-arm64.tar.gz"
      sha256 "6426123783822ea7a8a3e790e66113b98182ecc7b7a514175593b89771ee9ace"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/alanvardy/tod/releases/download/v0.8.0/tod-v0.8.0-linux-x86_64.tar.gz"
      sha256 "6426123783822ea7a8a3e790e66113b98182ecc7b7a514175593b89771ee9ace"
    elsif Hardware::CPU.arm?
      url "https://github.com/stacksjb/tod-dev/releases/download/v0.8.0/tod-0.8.0-linux-arm64.tar.gz"
      sha256 "6426123783822ea7a8a3e790e66113b98182ecc7b7a514175593b89771ee9ace"
    end
  end

  def install
    bin.install "tod"
  end

  test do
    expected_output = "Tod #{version}"
    assert_match expected_output, shell_output("#{bin}/tod -V")
  end
end
