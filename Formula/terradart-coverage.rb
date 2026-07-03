class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.24.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.24.0/terradart-coverage-darwin-arm64"
      sha256 "a5e569d80efed24c881fe7afb321414e8be78b6d1eced84edd5b5b6a61314bae"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.24.0/terradart-coverage-darwin-amd64"
      sha256 "fe202fe956a5a96444884eac3225abc64a6b113a6806dd0ff2eaa443825b9151"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.24.0/terradart-coverage-linux-amd64"
    sha256 "cb3977626a16756ad2ebea1f3a93039d5e34d1111d1cb0411433dd1676b1daad"
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
