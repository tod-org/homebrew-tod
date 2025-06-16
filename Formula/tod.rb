class Tod < Formula
  desc "Unofficial Todoist command-line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  version "0.8.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/stacksjb/tod-dev/releases/download/v0.8.0/tod-0.8.0-darwin-amd64.tar.gz"
      sha256 "efa918edad03a8aac7ae420a229b1ac08c7ca98503034017d08205cfbe3a1ff3"
    elsif Hardware::CPU.arm?
      url "https://github.com/stacksjb/tod-dev/releases/download/v0.8.0/tod-0.8.0-darwin-arm64.tar.gz"
      sha256 "2da60dce413281c67d6b9b23c9609b00265afb0fe9f835b943e3302eb8cc7529"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/stacksjb/tod-dev/releases/download/v0.8.0/tod-0.8.0-linux-amd64.tar.gz"
      sha256 "e82a99a23fe3b7f3473e05c3f24ade1f43cd3ec871c0450387fa5f4c51571c8c"
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
