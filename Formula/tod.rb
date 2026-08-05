class Tod < Formula
  desc "Unofficial Todoist command-line client"
  homepage "https://www.tod.cx"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.18.0/tod-0.18.0-darwin-amd64.tar.gz"
      sha256 "ed821073cfa773d0a979060ca65f72b56150ccad873622e9af23fb439375837e"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.18.0/tod-0.18.0-darwin-arm64.tar.gz"
      sha256 "125e87278b1e65c870bc34a780d8d88267d34ae685f30d9657bbf077b43c93b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.18.0/tod-0.18.0-linux-amd64.tar.gz"
      sha256 "b9c0e0fa4c53954792c20dda747601878346793e0509d88921a4ebdaed6ba941"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.18.0/tod-0.18.0-linux-arm64.tar.gz"
      sha256 "7a540ae19dc47d32b4f67025e4d22775475cab51dd6631314b721d90f3ef0c33"
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
