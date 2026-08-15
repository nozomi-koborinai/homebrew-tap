class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.25.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.0/terradart-coverage-darwin-arm64"
      sha256 "578c5c7c5d2f0a7e0c24d861879fc119b4af0f2e32fd1144ad5d248ead15fce0"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.0/terradart-coverage-darwin-amd64"
      sha256 "f6251c6b18f69c9500a68287ffca0d47630840f3ff0fc4d8c539b59a1942ae36"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.0/terradart-coverage-linux-amd64"
    sha256 "4b911ccd44f5b4518dbff1cb620c81bf0b5ccb6e57d8f8bb2681cf543bf8edc5"
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
