# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tod < Formula
  desc "An unofficial Todoist command line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  url "https://github.com/alanvardy/tod/releases/download/v0.7.0/tod-mac.tar.gz"
  sha256 "bef2af0a870ca57f1485313cb60ecc8ab8cea66e4f2c589cda2fd6ed9588fbed"
  version "0.7.0"

  def install
    bin.install "tod"
  end
end
