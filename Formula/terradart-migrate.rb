class TerradartMigrate < Formula
  desc "HCL to Dart migrator for TerraDart (Terraform source tree to Stacks)"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.28.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.0/terradart-migrate-darwin-arm64"
      sha256 "ae0c7bae44321a7f3b40f44deb76ac39b0d0cb5d267882da8677cf95d0da60fb"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.0/terradart-migrate-darwin-amd64"
      sha256 "1ed39e30d39a7e99778d627541e355a7c640e1da48119f6740c856b9a03f64b2"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.0/terradart-migrate-linux-amd64"
    sha256 "937808368b80171266a18546cba93cf552691cccd20cc31b5034d50e5a6622c7"
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
