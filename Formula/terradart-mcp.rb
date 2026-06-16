class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.14.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.14.0/terradart-mcp-darwin-arm64"
      sha256 "26c7ee7473ce0c8aa69acfb8afcdffe4f47f25e60735b81973fe91360c0e2385"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.14.0/terradart-mcp-darwin-amd64"
      sha256 "40445ec0ef1f893fdfcef387cd036dc38f2c6cd2ff86ab66807e0289b4498852"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.14.0/terradart-mcp-linux-amd64"
    sha256 "bb87c7d3441edeb35741f2d6441ea654321a0d6ad8fca9285d526e1960df792f"
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
