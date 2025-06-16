class Tod < Formula
  desc "Unofficial Todoist command-line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  version "0.8.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/stacksjb/tod-dev/releases/download/v0.8.0/tod-0.8.0-darwin-amd64.tar.gz"
      sha256 "f90182fab9e4e942fc6f7265c0d1cb5c5796eb7ccfd9381295cf2f596681d9f2"
    elsif Hardware::CPU.arm?
      url "https://github.com/stacksjb/tod-dev/releases/download/v0.8.0/tod-0.8.0-darwin-arm64.tar.gz"
      sha256 "47bd61aa0ac196fe571f4550b787f87462b3398647db0fc154561cb032a0cadf"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/stacksjb/tod-dev/releases/download/v0.8.0/tod-0.8.0-linux-amd64.tar.gz"
      sha256 "5a8aa5e0456ac6b50101c9fafadf804ebb1ff93c56374e924af5a617c83d40e5"
    elsif Hardware::CPU.arm?
      url "https://github.com/stacksjb/tod-dev/releases/download/v0.8.0/tod-0.8.0-linux-arm64.tar.gz"
      sha256 "55153a179abb618f56926591e83ad2f6da8e69dfc6e371610d243eb6398f012c"
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
