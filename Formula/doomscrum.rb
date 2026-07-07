require "download_strategy"

# doomscrum's source repo is private (docs/adoption/2026-07-07-installable-releases/);
# authenticate release-asset downloads with HOMEBREW_GITHUB_API_TOKEN.
class DoomscrumPrivateReleaseDownloadStrategy < CurlDownloadStrategy
  def initialize(url, name, version, **meta)
    token = Homebrew::EnvConfig.github_api_token
    raise CurlDownloadStrategyError, "Set HOMEBREW_GITHUB_API_TOKEN (repo-scoped PAT) to install from this private-repo tap." if token.blank?

    meta[:headers] ||= []
    meta[:headers] << "Authorization: token #{token}"
    meta[:headers] << "Accept: application/octet-stream"
    super
  end
end

class Doomscrum < Formula
  desc "PRD brainrot triage: backlog specs as swipeable shortform video"
  homepage "https://github.com/phrazzld/doomscrum"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://api.github.com/repos/phrazzld/doomscrum/releases/assets/469466223",
          using: DoomscrumPrivateReleaseDownloadStrategy
      sha256 "3fab10ed3196498772dfd87c1510448c9159ef4271250a8441f26fc084fa71bf"
    end
  end

  on_linux do
    on_intel do
      url "https://api.github.com/repos/phrazzld/doomscrum/releases/assets/469466225",
          using: DoomscrumPrivateReleaseDownloadStrategy
      sha256 "f9af923e004039cd82324a0fc46c52356533cf9dc0aa3d6eada122b6a8c93f84"
    end
  end

  def install
    bin.install "doomscrum"
  end

  test do
    system "#{bin}/doomscrum", "--help"
  end
end
