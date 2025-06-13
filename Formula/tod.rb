class Tod < Formula
  desc "Unofficial Todoist command-line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  version "0.8.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/alanvardy/tod/releases/download/v0.8.0/tod-v0.8.0-macOS-x86_64.tar.gz"
      sha256 "9871ac97cc14626cec3434e881638adf900e53569268c5531dd1387777e8ea78"
    elsif Hardware::CPU.arm?
      url "https://github.com/alanvardy/tod/releases/download/v0.8.0/tod-v0.8.0-macOS-arm64.tar.gz"
      sha256 "7c11c25683fff0ce311486b8d434b5a98116f613628b5aeb3eaf9dfdccf508cd"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/alanvardy/tod/releases/download/v0.8.0/tod-v0.8.0-linux-x86_64.tar.gz"
      sha256 "af4b1dee8f64dd4b1ddde3ed5a35f20e4644bdceb58e0edca673d3f1e10fbdde"
    elsif Hardware::CPU.arm?
      url "https://github.com/alanvardy/tod/releases/download/v0.8.0/tod-v0.8.0-linux-arm64.tar.gz"
      sha256 "c57eeaee9ba9f6c6289bba07e40f7cea6b017d9f0b9c84b1ed1094e2a4efa5f4"
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
