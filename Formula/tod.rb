class Tod < Formula
  desc "Unofficial Todoist command-line client"
  homepage "https://github.com/tod-org/tod"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.11.0/tod-0.11.0-darwin-amd64.tar.gz"
      sha256 "726bf38230c0699be432424531e8bbf9260616e7ff16295164ceb4ebde3a738a"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.11.0/tod-0.11.0-darwin-arm64.tar.gz"
      sha256 "871f8b8efee6e0b4c89f9bc80d649309938e79bc528c54850814c5db336f4058"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.11.0/tod-0.11.0-linux-amd64.tar.gz"
      sha256 "ac6329c3a2929e83380812bd41a9a0623a7ed86e8c5bfcf69c6a349e7a9b7e07"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.11.0/tod-0.11.0-linux-arm64.tar.gz"
      sha256 "2b783d7476abbabe5b8740471da2007b23bccc46bb35339b168b037594dc4a0d"
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
