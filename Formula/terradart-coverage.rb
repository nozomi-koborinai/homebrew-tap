class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.21.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.21.0/terradart-coverage-darwin-arm64"
      sha256 "c940846377df88d3716125b4cc43cf9f467dc645dd1062356fb129ed2a20ca2e"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.21.0/terradart-coverage-darwin-amd64"
      sha256 "aaa3088ea57ac3847880e6869a27fcd7f19517bd9628612275deb06ee89b0d1b"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.21.0/terradart-coverage-linux-amd64"
    sha256 "a007df47d8ab88c99728aecbf50133e2530ac1a7705701f9f29e1484b3c4729b"
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
