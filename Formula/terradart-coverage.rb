class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.28.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.1/terradart-coverage-darwin-arm64"
      sha256 "96965c488394d8c281b67fd2510a5b10c6fc0efac07c9d0e6b4681a11ab17972"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.1/terradart-coverage-darwin-amd64"
      sha256 "ffc5f05cf4f4f2b591b6382a6399afba57b39e5031d191bf9039d242a5b105bf"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.1/terradart-coverage-linux-amd64"
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
