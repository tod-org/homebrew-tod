# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tod < Formula
  desc "An unofficial Todoist command line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  url "https://github.com/alanvardy/tod/releases/download/v0.7.5/tod-mac.tar.gz"
  sha256 "e98359a8510cc417497a03e429bd731686d61f970b17df3690118eb940e74ade"
  version "0.7.5"

  def install
    bin.install "tod"
  end
end
