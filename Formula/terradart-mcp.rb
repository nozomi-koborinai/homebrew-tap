class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.26.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.26.0/terradart-mcp-darwin-arm64"
      sha256 "018f349ac3aa66882a2313650805fa19432c64249a8761068da9edbccc6bb6a3"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.26.0/terradart-mcp-darwin-amd64"
      sha256 "213c4b232c99ea2d6120288e6e0117900436a2a22f1a2ab7e71804563fe599ab"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.26.0/terradart-mcp-linux-amd64"
    sha256 "a1f8ff1c611a02682652718609f7b8324c7bd1a13565d9154d53c032b3dd49ca"
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
