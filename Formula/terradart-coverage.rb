class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.25.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.1/terradart-coverage-darwin-arm64"
      sha256 "3379b848fbe1635b61e050ed31cc940c389165c90db1548cac343678f4a31b2e"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.1/terradart-coverage-darwin-amd64"
      sha256 "04ab0a99dce63518ad094b146c36dc1f603def96ab5922f3f7ce095bfc736093"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.1/terradart-coverage-linux-amd64"
    sha256 "cb4d9ed1f6ba7b1f3cb0fa128e1d14dadaa5f79613319e9a5f8d205606e0be8e"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "terradart-coverage-darwin-arm64" => "terradart-coverage"
      else
        bin.install "terradart-coverage-darwin-amd64" => "terradart-coverage"
      end
    else
      bin.install "terradart-coverage-linux-amd64" => "terradart-coverage"
    end
  end

  test do
    assert_match "terradart-coverage", shell_output("#{bin}/terradart-coverage --help")
  end
end
