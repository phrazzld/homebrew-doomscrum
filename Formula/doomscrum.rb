class Doomscrum < Formula
  desc "PRD brainrot triage: backlog specs as swipeable shortform video"
  homepage "https://github.com/misty-step/doomscrum"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/misty-step/doomscrum/releases/download/v0.2.2/doomscrum-macos-arm64.tar.gz"
      sha256 "726a988b47b6a7cf6201ba2431aead311924159fa9bc62240917109a5bf11c24"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/misty-step/doomscrum/releases/download/v0.2.2/doomscrum-linux-x86_64.tar.gz"
      sha256 "9d7b04f740522fd8e2512e7a2b6015afb0630e1983da61d94edb3363e69ed4ed"
    end
  end

  def install
    bin.install "doomscrum"
  end

  test do
    system "#{bin}/doomscrum", "--help"
  end
end
