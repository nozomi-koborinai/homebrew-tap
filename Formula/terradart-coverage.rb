class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.16.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.16.0/terradart-coverage-darwin-arm64"
      sha256 "cf710e769f5ab28c0ce175dadacd1ba1812999fba43b6e73abf23f8614665538"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.16.0/terradart-coverage-darwin-amd64"
      sha256 "3108377c37299a1658053c8f01809873d6504540de51fcd2300ae806f9051293"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.16.0/terradart-coverage-linux-amd64"
    sha256 "753525660463acb52e847e2048a67f192d3137ac6eeceffdf0cb303f8725041d"
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
