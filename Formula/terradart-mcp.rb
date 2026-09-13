class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.28.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.0/terradart-mcp-darwin-arm64"
      sha256 "707ea3a341b12d89236012f4ff1d6090daeedd01028b6d92ed2e88d9ec3ddf5c"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.0/terradart-mcp-darwin-amd64"
      sha256 "2c57c45d8a6cd31731fb162fff9c1abe9e8f6bc4b04054937a5a2ddb3015dbed"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.0/terradart-mcp-linux-amd64"
    sha256 "7b0af45f34448184c9d2b5e38db8f1c2f3c64395f3c8a2ac9d49e5fead1147ec"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "terradart-mcp-darwin-arm64" => "terradart-mcp"
      else
        bin.install "terradart-mcp-darwin-amd64" => "terradart-mcp"
      end
    else
      bin.install "terradart-mcp-linux-amd64" => "terradart-mcp"
    end
  end

  test do
    assert_match "terradart-mcp", shell_output("#{bin}/terradart-mcp --version")
  end
end
