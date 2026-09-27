class TerradartMigrate < Formula
  desc "HCL to Dart migrator for TerraDart (Terraform source tree to Stacks)"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.29.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.29.0/terradart-migrate-darwin-arm64"
      sha256 "0d59fd773b5fb5c0ce7852c8074b6c1172a351fb9e734fb6f8020e533d2bd554"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.29.0/terradart-migrate-darwin-amd64"
      sha256 "ba6a1deedd532bd59fb05401207200b53b32b5a7d96319bdb8acd2c440da978a"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.29.0/terradart-migrate-linux-amd64"
    sha256 "d5cafbf38a25ee29a3b819238d1069a68454d64087c658ac6b82cbe7b7ec8212"
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
