class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.25.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.2/terradart-mcp-darwin-arm64"
      sha256 "712187c176caa39916b2fe82cdffea9ea63207d710873cd798c3de68d8b06a0b"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.2/terradart-mcp-darwin-amd64"
      sha256 "68b1ec1b924d8e2f23ad94e393031caadce38fc6e5c61571d740cd213770dda5"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.2/terradart-mcp-linux-amd64"
    sha256 "37774b68fb1aab1febb4c8359bff8cfd99f8e4c27a97e1bd526ad5e43c018b43"
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
