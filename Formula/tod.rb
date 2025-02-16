# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tod < Formula
  desc "An unofficial Todoist command line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  url "https://github.com/alanvardy/tod/releases/download/v0.6.30/tod-mac.tar.gz"
  sha256 "60ee5930acb251f0b6b602c2b400a6cd441b5d614f0711437ff12b6d89a8f168"
  version "0.6.30"

  def install
    bin.install "tod"
  end
end
