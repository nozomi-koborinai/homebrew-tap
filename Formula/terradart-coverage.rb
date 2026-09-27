class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.29.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.29.0/terradart-coverage-darwin-arm64"
      sha256 "ed2e9fe9e8fdbc580aa262431b0b44e8e8fc71816f0f8f1a1451656e6bd4d50d"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.29.0/terradart-coverage-darwin-amd64"
      sha256 "19e0c239237b8965fb185a5c022d44255c5b5268c5e5eaa5d40c225add025c30"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.29.0/terradart-coverage-linux-amd64"
    sha256 "f517e22c8266846fbc6221ee06e3f5f6e4acadefaa7e1c117f443affe800b912"
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
