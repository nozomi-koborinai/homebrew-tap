class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.19.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.19.0/terradart-coverage-darwin-arm64"
      sha256 "c792e33cf498d19685c1cf5606919f2f19eefcb5e162992e8e508208ae50faf5"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.19.0/terradart-coverage-darwin-amd64"
      sha256 "3e90ddca2a3dafa9eaab7bc08b1ab71e447c8fcddeb22380e2686193ec4fef92"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.19.0/terradart-coverage-linux-amd64"
    sha256 "adc359974b080f20c46a100cf4c6100c65989086595e57a7546a8e3b36504102"
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
