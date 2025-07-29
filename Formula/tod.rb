class Tod < Formula
  desc "An unofficial Todoist command-line client"
  homepage "https://github.com/tod-org/tod"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.10.0/tod-0.10.0-darwin-amd64.tar.gz"
      sha256 "ff6292f1c3d8159954d3a52084a6a2e8043d006c5fdb84d5755095defd20cdb7"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.10.0/tod-0.10.0-darwin-arm64.tar.gz"
      sha256 "b59ad53c5b823fd18b8948008a8aeeb5fa05051f250c268c43504a1cdf72ce6c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.10.0/tod-0.10.0-linux-amd64.tar.gz"
      sha256 "823b5fc6b26eb463608e4251d3ef15de99dd1fd87202c888842b71e90cbf28ba"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.10.0/tod-0.10.0-linux-arm64.tar.gz"
      sha256 "1eb96f754562eb00f1e67a02ea705b30f8e6b56ff5b2745fd2f924c33e76249a"
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
