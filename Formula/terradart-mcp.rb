class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.19.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.19.0/terradart-mcp-darwin-arm64"
      sha256 "eb5b40566bf59f9cbe1ae0f5b1001a35dfb19d6b22117836556ebe38c9482b18"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.19.0/terradart-mcp-darwin-amd64"
      sha256 "3c629697111c27ef2e10f2e7d97cd6cae4c91a96b6e5249fa817d51ac61f7efd"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.19.0/terradart-mcp-linux-amd64"
    sha256 "1ce0328bceac490274b4304912d97563c202ec62a59a760bc62d45d295ba8d64"
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
