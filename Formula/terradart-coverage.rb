class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.17.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.17.0/terradart-coverage-darwin-arm64"
      sha256 "faf7288f8d12eef5b00b3fc6886f68ad8bb6a0d75f489e2ed3eb765be176395a"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.17.0/terradart-coverage-darwin-amd64"
      sha256 "e85abc6866252dd5cf3de6b258ebc46fc164a61de0b4bf5b496909f63f1ff8b1"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.17.0/terradart-coverage-linux-amd64"
    sha256 "093d748e4de4644c827a7882d8d52e0f926952d908eca6f1a65080d3e148ad89"
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
