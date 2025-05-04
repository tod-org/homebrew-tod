# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tod < Formula
  desc "An unofficial Todoist command line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  url "https://github.com/alanvardy/tod/releases/download/v0.7.3/tod-mac.tar.gz"
  sha256 "d575ab955afba746586fb97dcfb8c2fb716407f20bd1f170e3111066e9a0fdae"
  version "0.7.3"

  def install
    bin.install "tod"
  end
end
