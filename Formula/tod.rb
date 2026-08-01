class Tod < Formula
  desc "Unofficial Todoist command-line client"
  homepage "https://www.tod.cx"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.17.0/tod-0.17.0-darwin-amd64.tar.gz"
      sha256 "5bc0eda71c083e34c2d77b33bcc48903b0cb8bb7ef21770e8c4fdc697ec2ee5a"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.17.0/tod-0.17.0-darwin-arm64.tar.gz"
      sha256 "910196dbcf845b8513c0457af5e18fdc3580f8a7fe90b06909406f02e8b96c96"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.17.0/tod-0.17.0-linux-amd64.tar.gz"
      sha256 "3ff6570fc6453d0cc510f6bceda6195de654fd94ca0fb2427bdc3b9cc3255d78"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.17.0/tod-0.17.0-linux-arm64.tar.gz"
      sha256 "2cd7e354a2264f5eec497d5f9e648e8c334839e1547123ebcfaefadfbfe0b8d8"
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
