class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.22.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.22.0/terradart-coverage-darwin-arm64"
      sha256 "1999947c1012f8286329b5a422a88943b6cb86a32b73ccda14eeb8bd61781287"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.22.0/terradart-coverage-darwin-amd64"
      sha256 "e5f8710ac0605ba227782d87ecb664cb22e11c7772b10eef9f66e883fedfe5c0"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.22.0/terradart-coverage-linux-amd64"
    sha256 "452218d7c0cffd9e3fe46fdabdbcc5b84d208a4cd86e4be87d658fadc9f92c7f"
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
