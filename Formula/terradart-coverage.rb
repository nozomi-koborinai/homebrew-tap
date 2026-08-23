class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.25.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.3/terradart-coverage-darwin-arm64"
      sha256 "23360d4973fee23ec2c1778b1e04e6efa58c30720196c8b74c39f23a439e2019"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.3/terradart-coverage-darwin-amd64"
      sha256 "24d0d01eeadb6ba61a47d9f34c8976ba05860be3164c61db3dbb6e3680778d0a"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.3/terradart-coverage-linux-amd64"
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
