class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.23.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.23.0/terradart-coverage-darwin-arm64"
      sha256 "30be0726db8a97dc452c6bdf711d1def5411da2a626928dcee21e964ed42d5da"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.23.0/terradart-coverage-darwin-amd64"
      sha256 "076f6ea8d906d765fb8c50e00abc5bad765c9dc4f8ce713a763e61a00104355e"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.23.0/terradart-coverage-linux-amd64"
    sha256 "5693f2a22decc518ac23cfc0d033a01c3720978c0b12d77a730752fa56c9f81d"
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
