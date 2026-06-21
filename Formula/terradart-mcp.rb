class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.16.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.16.0/terradart-mcp-darwin-arm64"
      sha256 "1596c9559d67c8f8389b87d774952cb2c60df5528f274b6b4892cb5b1b6f2567"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.16.0/terradart-mcp-darwin-amd64"
      sha256 "4994dafa6bddf660365c7a814164692c160af54c376820c41699dd4b944bb5f6"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.16.0/terradart-mcp-linux-amd64"
    sha256 "5a42da14a488a9200f0d6625c1f566272faa20cab23e3a763617a6b085d83511"
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
