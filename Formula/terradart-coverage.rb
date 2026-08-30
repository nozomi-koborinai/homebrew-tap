class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.27.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.27.0/terradart-coverage-darwin-arm64"
      sha256 "82188bc8cadf7bfda65e9064744846aeacfe66110d22739a3832d1ac8160e522"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.27.0/terradart-coverage-darwin-amd64"
      sha256 "370ef44402a04be99e6115caef574d718904fe315f7c43f525f3c29cd89b0ae9"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.27.0/terradart-coverage-linux-amd64"
    sha256 "094ace7f78de12047507079b187b7da3521b967ee46386bfe8a1e2d821765169"
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
