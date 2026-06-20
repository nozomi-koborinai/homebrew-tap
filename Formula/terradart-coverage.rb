class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.15.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.15.0/terradart-coverage-darwin-arm64"
      sha256 "5b12173a65f773ab3bba1684ff84d733e5c672aaf6c85d77a017a312e7499455"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.15.0/terradart-coverage-darwin-amd64"
      sha256 "e605f2b85b19a72b6482cee685f430d740c6162793dc54b6df936b33e9703e3f"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.15.0/terradart-coverage-linux-amd64"
    sha256 "c9a509275df68cd56b1ffc9794b2a37ecb5d11aa10bd622dab8bd7927b644ded"
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
