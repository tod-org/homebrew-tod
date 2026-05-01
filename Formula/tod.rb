class Tod < Formula
  desc "Unofficial Todoist command-line client"
  homepage "https://www.tod.cx"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.12.1/tod-0.12.1-darwin-amd64.tar.gz"
      sha256 "6cefd7b0684089f9548f49a7bd9209eede50ea5553ae304643ceb7fb18f11e5c"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.12.1/tod-0.12.1-darwin-arm64.tar.gz"
      sha256 "77097fcf0e0a79d93ec0ceaf88761ef50ffb86e04817c85490e07cc6aad64362"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.12.1/tod-0.12.1-linux-amd64.tar.gz"
      sha256 "208ff708159f99a9e0e63ff5bebbba291e7edba010610b08ced1dc4d6d3f4af7"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.12.1/tod-0.12.1-linux-arm64.tar.gz"
      sha256 "6b916a0f4c9e85c529a01925ee402dac83b8b34e033e9ef356452e34801942d0"
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
