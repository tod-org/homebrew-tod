# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tod < Formula
  desc "An unofficial Todoist command line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  url "https://github.com/alanvardy/tod/releases/latest/download/tod-mac.tar.gz"
  sha256 "437642405818cf3201c054494192e42d42d10b7c9d26c8c90a10add1d9cfdb4d"
  version "0.6.29"

  def install
    bin.install "tod"
  end
end
