class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.14.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.14.0/terradart-coverage-darwin-arm64"
      sha256 "b03d640ec4cf86d488529195bb8d1b24d5e6cde83b7288f092851c0620fe7627"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.14.0/terradart-coverage-darwin-amd64"
      sha256 "92aca953984a98635dccd4dea239c73658013103eda73c94d817e08ad18d31ac"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.14.0/terradart-coverage-linux-amd64"
    sha256 "7ba0043abb532bd58a7d6065a8644e85341c34bd3d1880a47eb6d3a606c84184"
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
