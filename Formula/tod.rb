class Tod < Formula
  desc "Unofficial Todoist command-line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/alanvardy/tod/releases/download/v0.9.1/tod-0.9.1-darwin-amd64.tar.gz"
      sha256 "1d76b365f374ac6b1e5dc2ddb71578c7d511f01ae81fd97d312ed9eea662bd14"
    end

    on_arm do
      url "https://github.com/alanvardy/tod/releases/download/v0.9.1/tod-0.9.1-darwin-arm64.tar.gz"
      sha256 "3bef7a54358bf2ff1e3cdc6b8b4eb1b85f3f7b3684a2d45bcd8e4d2ed762bef5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alanvardy/tod/releases/download/v0.9.1/tod-0.9.1-linux-amd64.tar.gz"
      sha256 "0d7d85d126ecab631b80613831900c398998b42a97806c39969efbf102e3a8a1"
    end

    on_arm do
      url "https://github.com/alanvardy/tod/releases/download/v0.9.1/tod-0.9.1-linux-arm64.tar.gz"
      sha256 "3947e9fe29556a2556900ebbaa66aef48834962288c9860e33efe31498c7599a"
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
