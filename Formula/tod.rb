class Tod < Formula
  desc "Unofficial Todoist command-line client"
  homepage "https://www.tod.cx"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.15.0/tod-0.15.0-darwin-amd64.tar.gz"
      sha256 "847b08aec16afc44f87b909579e7b3b59df8ac1a27b36c63d3438a4ee661f259"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.15.0/tod-0.15.0-darwin-arm64.tar.gz"
      sha256 "9ef9d72e7b984f4d9a331da9576fc167088b662c15b836d37e3be9d0c24ee674"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.15.0/tod-0.15.0-linux-amd64.tar.gz"
      sha256 "11873f818980dd959ed926578eb809206e304f926a0381cfb7f6ae80d099e8dc"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.15.0/tod-0.15.0-linux-arm64.tar.gz"
      sha256 "d2c3dba043567f531569ed78757ebc37c19330e388d268cc746cc6245de90772"
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
