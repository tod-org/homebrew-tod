# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tod < Formula
  desc "An unofficial Todoist command line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  url "https://github.com/alanvardy/tod/releases/download/v0.6.31/tod-mac.tar.gz"
  sha256 "5f421c0f93cd1dd8f5f4c13bbe6b918e4b0af06befcb3d9eb675fb9a46a79118"
  version "0.6.31"

  def install
    bin.install "tod"
  end
end
