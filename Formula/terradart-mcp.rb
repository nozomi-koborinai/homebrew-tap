class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.25.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.0/terradart-mcp-darwin-arm64"
      sha256 "53a9e04455c6dac68c05aef2d2e06369974d1b1e63bc91a229166ea0a6a70af0"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.0/terradart-mcp-darwin-amd64"
      sha256 "3d2427587c5096859f39e947e04b1474bf34b274254c992d74bfb4258652dc96"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.0/terradart-mcp-linux-amd64"
    sha256 "cd86cb8cce4c093daf09a37d319aae931d9a95b6437b91d608236f7c64edd1a1"
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
