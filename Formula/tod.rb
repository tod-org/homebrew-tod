# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tod < Formula
  desc "An unofficial Todoist command line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  url "https://github.com/alanvardy/tod/releases/download/v0.7.6/tod-mac.tar.gz"
  sha256 "bcc1748e616080415525b929018d16fa4d87acb6e92b56971cbb45d2837edba4"
  version "0.7.6"

  def install
    bin.install "tod"
  end
end
