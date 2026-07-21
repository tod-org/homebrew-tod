class Tod < Formula
  desc "Unofficial Todoist command-line client"
  homepage "https://www.tod.cx"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.16.0/tod-0.16.0-darwin-amd64.tar.gz"
      sha256 "785fe00eabed665b76a8443ffef664ed5ad150a5eab323019dad531c5ccf1f80"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.16.0/tod-0.16.0-darwin-arm64.tar.gz"
      sha256 "d4a1ffbcbd321b0bc8311583e8fcaf1022fea1adbc9744395d89275c28c7ddd2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.16.0/tod-0.16.0-linux-amd64.tar.gz"
      sha256 "c9f5e0eaa411942411ae723fd557dbc0426be9fcc454ba049243642dd4ae88a9"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.16.0/tod-0.16.0-linux-arm64.tar.gz"
      sha256 "80c8ead206ee1a8235ac9fde1129671554b3f12a8954846eec6a19a8163bd135"
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
