class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.20.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.20.0/terradart-coverage-darwin-arm64"
      sha256 "ec67f04c4c71410b9d3052241e5ac07a3b1cec73651aa9b573f5e9cad00c81a4"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.20.0/terradart-coverage-darwin-amd64"
      sha256 "457ca44741a213c1c8a6c3c86641843aae23128817cd73673f954a4236601df0"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.20.0/terradart-coverage-linux-amd64"
    sha256 "612f57cdb314afb54f5af694f372f186364eb6266dc00ec9185e222580f290d0"
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
