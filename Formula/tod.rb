class Tod < Formula
  desc "Unofficial Todoist command-line client"
  homepage "https://www.tod.cx"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.11.1/tod-0.11.1-darwin-amd64.tar.gz"
      sha256 "406825724bc9a0193eb423f9c3a810f819f660fa9d4cf956b870bbfde14c19f6"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.11.1/tod-0.11.1-darwin-arm64.tar.gz"
      sha256 "f99d160a55b25f0498856a27bf18308dc4d6b48049d1be30515cd4dd4fc099ff"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/tod-org/tod/releases/download/v0.11.1/tod-0.11.1-linux-amd64.tar.gz"
      sha256 "cd395b740cad4a56e2bcbacf2dfd55a65b2ad37bf21f1478a11d949dedaf3087"
    end

    on_arm do
      url "https://github.com/tod-org/tod/releases/download/v0.11.1/tod-0.11.1-linux-arm64.tar.gz"
      sha256 "54d09ab040505efa19521bd5a84f9fd0ef915f9c519766a83c02bcedd119bbb4"
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
