class Tod < Formula
  desc "Unofficial Todoist command-line client"
  homepage "https://www.tod.cx"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.14.0/tod-0.14.0-darwin-amd64.tar.gz"
      sha256 "726a0e3701f69f92f36ae910346e41a52fcdff2d9e08f39d2b59dda2bdb77326"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.14.0/tod-0.14.0-darwin-arm64.tar.gz"
      sha256 "9f5162fa6b9e2a89e2659681a1d5ed26d0e1481f0346543a15eaa6890dd12273"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.14.0/tod-0.14.0-linux-amd64.tar.gz"
      sha256 "ac1372da17790742babccacc7e5d6984842fedf5df4c2de0ba957884d4701632"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.14.0/tod-0.14.0-linux-arm64.tar.gz"
      sha256 "939f88d60ea6eca690a2d824c9840ec32adbdd6a765418edb7eb5210f1a00ab7"
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
