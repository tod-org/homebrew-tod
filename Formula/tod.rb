class Tod < Formula
  desc "Unofficial Todoist command-line client"
  homepage "https://www.tod.cx"
  version "0.11.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.11.3/tod-0.11.3-darwin-amd64.tar.gz"
      sha256 "c2aa2abb3010885f5c17cbc21bf5cf6bb49f42d688f08a3ed9a704f51e05081a"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.11.3/tod-0.11.3-darwin-arm64.tar.gz"
      sha256 "baafd9c5046647a81919ebb78b64056f65a928d02fed247827a9ce6e850b1cc3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.11.3/tod-0.11.3-linux-amd64.tar.gz"
      sha256 "6ee4e1bcd303be9e0cb81dfd97f4e307f5b3ca9d9d8c907239a6ebd8fc5ffac9"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.11.3/tod-0.11.3-linux-arm64.tar.gz"
      sha256 "cc058083a9d6ec742ad29eecdaed47907245832bb4d29c86cae3e9620cbbfdb2"
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
