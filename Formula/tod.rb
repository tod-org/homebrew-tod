# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tod < Formula
  desc "An unofficial Todoist command line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  url "https://github.com/alanvardy/tod/releases/download/v0.7.2/tod-mac.tar.gz"
  sha256 "5ba0c888c20e88c646e032d3c80450ee9f4cece70ef06687e6294c7b41233201"
  version "0.7.2"

  def install
    bin.install "tod"
  end
end
