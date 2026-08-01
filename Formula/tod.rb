class Tod < Formula
  desc "Unofficial Todoist command-line client"
  homepage "https://www.tod.cx"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.17.1/tod-0.17.1-darwin-amd64.tar.gz"
      sha256 "ef0d9d0337cc9706d65523b648561d3cde4281875e468023b0638e38025ce377"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.17.1/tod-0.17.1-darwin-arm64.tar.gz"
      sha256 "1ab180533de523e7af2701a2b6cd727af0d2e3baca605a3072f88cc242c51394"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.17.1/tod-0.17.1-linux-amd64.tar.gz"
      sha256 "ade84a4b7a01320233827ff27dc063adae9612277c452892fbc17f10d2ceb8fc"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.17.1/tod-0.17.1-linux-arm64.tar.gz"
      sha256 "c877c8402e5e02d2d4c767d200e222d4ca21dd39ec75b29300e6bc11afac8771"
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
