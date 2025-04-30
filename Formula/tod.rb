# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tod < Formula
  desc "An unofficial Todoist command line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  url "https://github.com/alanvardy/tod/releases/download/v0.7.1/tod-mac.tar.gz"
  sha256 "d034efa84c9412dd62c5eb824af73a36882694ac1d38f14f0f860946d4d160c1"
  version "0.7.1"

  def install
    bin.install "tod"
  end
end
