class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.17.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.17.1/terradart-coverage-darwin-arm64"
      sha256 "197fea1d836a71dcbb45a4f4caaba99eb4b1e9fa6a452d4d1e10bc66fce0eea8"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.17.1/terradart-coverage-darwin-amd64"
      sha256 "01f3e28b9799753e2eb306a4c7d54a878b4c37b7eba38286c39c39d0f38e1ac1"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.17.1/terradart-coverage-linux-amd64"
    sha256 "b6bc8c8c9273ffc91090bdcab705a5dccb11231c830f6d4c2c40fd16f167e251"
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
