class Tod < Formula
  desc "Unofficial Todoist command-line client"
  homepage "https://www.tod.cx"
  version "0.11.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.11.2/tod-0.11.2-darwin-amd64.tar.gz"
      sha256 "a6d1dc2dced73fb6976064b2071cd0df15a86a45ae3fed95b0d1bfa9fe42c9bf"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.11.2/tod-0.11.2-darwin-arm64.tar.gz"
      sha256 "9ad307168b6973769c321bc44f9b11884df82df9c4518ef586aac30ae360af85"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.11.2/tod-0.11.2-linux-amd64.tar.gz"
      sha256 "aad861b36cdaa2aa6a0641f9caf04d86aef018871e61b2fcd75f592a47298b3c"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.11.2/tod-0.11.2-linux-arm64.tar.gz"
      sha256 "ff1e8d912ba076c5b0ee4f8324a2209b73b1999751447c25cf5b7e30dfbd76b1"
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
