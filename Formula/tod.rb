class Tod < Formula
  desc "Unofficial Todoist command-line client"
  homepage "https://www.tod.cx"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.13.0/tod-0.13.0-darwin-amd64.tar.gz"
      sha256 "d80b51f248a17e24ebe9842809da13b6808330cc437c41f53efc2051d7ffb0e4"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.13.0/tod-0.13.0-darwin-arm64.tar.gz"
      sha256 "4673990a77eec04fe8048d53ce49618101c5ddc58c2619672bf3b37f02a0c682"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.13.0/tod-0.13.0-linux-amd64.tar.gz"
      sha256 "6aa3177855167919229c505161328f43708b60488733ebbec350e315824d8059"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.13.0/tod-0.13.0-linux-arm64.tar.gz"
      sha256 "73b559396784242862e22d3a7786b5a90ee288aac6429ac71ff82cc1e0b7d1e1"
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
