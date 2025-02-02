# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tod < Formula
  desc "An unofficial Todoist command line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  url "https://github.com/alanvardy/tod/releases/latest/download/tod-mac.tar.gz"
  sha256 "01a625eff5a0dec1c4f9f711d9f7f037fc9c1cc78d80bf6b7797a8e78c95576d"
  version "0.6.28"

  def install
    bin.install "tod"
  end
end
