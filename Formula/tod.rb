class Tod < Formula
  desc "Unofficial Todoist command-line client"
  homepage "https://www.tod.cx"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.12.0/tod-0.12.0-darwin-amd64.tar.gz"
      sha256 "74a87c5c6e4cb89b4a99aa8eade3dbe09df410aec0a478821bb3347311414828"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.12.0/tod-0.12.0-darwin-arm64.tar.gz"
      sha256 "ac0f21d0791d0a2d43ff4c888e1223b8dc14bcba98b4807aaae24a1f77addb84"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.12.0/tod-0.12.0-linux-amd64.tar.gz"
      sha256 "3a3af2c2f79d85585b12efd8f4f7170314f69aa7e9994eed2ab02827caf27981"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.12.0/tod-0.12.0-linux-arm64.tar.gz"
      sha256 "2acc64bdefd927a9a5de823b64268102b617ad24a77290221d97eb5df188a5a0"
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
