class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.28.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.0/terradart-coverage-darwin-arm64"
      sha256 "3ae3592cc6126c0b2db81453cd0f53218abbb0580f13d26e43e0f5b6cffc4590"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.0/terradart-coverage-darwin-amd64"
      sha256 "2b3a261e43c44d78285bcd612ea941c0ff75c860528e89ba60910ce7eb8d946b"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.0/terradart-coverage-linux-amd64"
    sha256 "ffa0b1c0d897c21605a0e55563504f8e3297aabe98f68444d59d0a1cafcf7ca7"
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
