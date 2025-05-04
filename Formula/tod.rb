# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tod < Formula
  desc "An unofficial Todoist command line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  url "https://github.com/alanvardy/tod/releases/download/v0.7.4/tod-mac.tar.gz"
  sha256 "cf5d10c13ad3ba83813675bbb54624f39dce85ea744cef4a624f1e0b3a200406"
  version "0.7.4"

  def install
    bin.install "tod"
  end
end
