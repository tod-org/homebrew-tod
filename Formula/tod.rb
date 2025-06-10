# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Tod < Formula
  desc "An unofficial Todoist command line client written in Rust"
  homepage "https://github.com/alanvardy/tod"
  version "0.8.0"

  if Hardware::CPU.intel?
    url "https://github.com/alanvardy/tod/releases/download/v0.8.0/tod-v0.8.0-macOS-x86_64.tar.gz"
    sha256 "9871ac97cc14626cec3434e881638adf900e53569268c5531dd1387777e8ea78"
  elsif Hardware::CPU.arm?
    url "https://github.com/alanvardy/tod/releases/download/v0.8.0/tod-v0.8.0-macOS-arm64.tar.gz"
    sha256 "7c11c25683fff0ce311486b8d434b5a98116f613628b5aeb3eaf9dfdccf508cd"
  end

  def install
    bin.install "tod"
  end
end
