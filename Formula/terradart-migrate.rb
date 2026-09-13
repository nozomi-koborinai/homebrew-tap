class TerradartMigrate < Formula
  desc "HCL to Dart migrator for TerraDart (Terraform source tree to Stacks)"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.28.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.1/terradart-migrate-darwin-arm64"
      sha256 "22e31f2c3d0da80c39218cea6f1a6a78eb81c05bec96c2b3c6bff881b164fc4e"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.1/terradart-migrate-darwin-amd64"
      sha256 "c5a71525f5cd7f72c857ade9a380514863b6c7da0425cde4d52b900b4397618c"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.1/terradart-migrate-linux-amd64"
    sha256 "3088147068e247a9f0fb6a6659fb959be7dfbff597d71bb3a4751f6fdbc5b5a6"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "terradart-migrate-darwin-arm64" => "terradart-migrate"
      else
        bin.install "terradart-migrate-darwin-amd64" => "terradart-migrate"
      end
    else
      bin.install "terradart-migrate-linux-amd64" => "terradart-migrate"
    end
  end

  test do
    assert_match "terradart-migrate", shell_output("#{bin}/terradart-migrate --version")
  end
end
