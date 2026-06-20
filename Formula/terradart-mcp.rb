class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.15.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.15.0/terradart-mcp-darwin-arm64"
      sha256 "87dec6d6cbd1f4480cc0e7d39518c891b9d86adf1621df3ad8bd4dccff2c6137"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.15.0/terradart-mcp-darwin-amd64"
      sha256 "9dcfffd99b3e272c88e98a984c88fc4565af02a2642b1a530d1323aca432228d"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.15.0/terradart-mcp-linux-amd64"
    sha256 "9bdfed935706f2a1c993d0d881c333ca32beaf693771c6839d1f06eac93af1d8"
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
