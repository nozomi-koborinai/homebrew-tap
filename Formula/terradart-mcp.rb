class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.23.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.23.0/terradart-mcp-darwin-arm64"
      sha256 "28c57439a541958398f3e6c6b336e3da19e2da1eeabe60abf5491dbd17b61a65"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.23.0/terradart-mcp-darwin-amd64"
      sha256 "cf3a75a2a91f5b4c53c187ba66e1c1d4e9f331b20b158b37fb9b8ea3f4de5016"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.23.0/terradart-mcp-linux-amd64"
    sha256 "b483653c11af1f27f978d354eb3a5f7ffb53c818b509d10aa6ac2ddcc945c79b"
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
