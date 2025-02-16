# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tod < Formula
  desc "An unofficial Todoist command line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  url "https://github.com/alanvardy/tod/releases/download/v0.6.30/tod-mac.tar.gz"
  sha256 "ec4c1940a3de896489deffc34ab976c41317ca9cc214763ce8d1649dfcfa4253"
  version "0.6.30"

  def install
    bin.install "tod"
  end
end
