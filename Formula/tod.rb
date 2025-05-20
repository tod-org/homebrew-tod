# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tod < Formula
  desc "An unofficial Todoist command line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  url "https://github.com/alanvardy/tod/releases/download/v0.7.7/tod-mac.tar.gz"
  sha256 "82974ad4643952a868ed91c258d22b48232a21f31e803a88e2593acd0cec78c5"
  version "0.7.7"

  def install
    bin.install "tod"
  end
end
