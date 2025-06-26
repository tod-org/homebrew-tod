class Tod < Formula
  desc "Unofficial Todoist command-line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/alanvardy/tod/releases/download/v0.9.0/tod-0.9.0-darwin-amd64.tar.gz"
      sha256 "024699b70ece8bb5f38600e4893ff6ccb3fe6676ea6d066d2e7c259b677fed46"
    end

    on_arm do
      url "https://github.com/alanvardy/tod/releases/download/v0.9.0/tod-0.9.0-darwin-arm64.tar.gz"
      sha256 "96f4d8482d74e56b0f18ae8ff8421f5051045d9b42c8459dad0254248636b74b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alanvardy/tod/releases/download/v0.9.0/tod-0.9.0-linux-amd64.tar.gz"
      sha256 "2388cfef80014386840b8dcef7530254812abcfd11c23cdd08e00277bf5a7f90"
    end

    on_arm do
      url "https://github.com/alanvardy/tod/releases/download/v0.9.0/tod-0.9.0-linux-arm64.tar.gz"
      sha256 "eca102a1c5976260875cc283d37982dde9a9aa97c63577f262f25d4268a62caf"
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
