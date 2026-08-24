class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.26.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.26.0/terradart-coverage-darwin-arm64"
      sha256 "b3fc362049d4ab16ccc8e66c3d703fd151e738ce374a3d8cbcacdca140b56e7c"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.26.0/terradart-coverage-darwin-amd64"
      sha256 "b0c1e1685a7b5be61aa933f6466746905129ad10de1c87dd170e97503eda9137"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.26.0/terradart-coverage-linux-amd64"
    sha256 "182ae950bc8c8984da4ab3a47657dfbbf58cffebc2521fa79642753fc130647a"
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
