class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.25.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.3/terradart-mcp-darwin-arm64"
      sha256 "80f72fb231fa3f4d519a9f4b1ffd9e6fff89a84e750f7c0a92556b86edf21da5"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.3/terradart-mcp-darwin-amd64"
      sha256 "0550fa89e33246d5c38e8002243048aea1f33c430abe2b977bd3634ab5c4716d"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.3/terradart-mcp-linux-amd64"
    sha256 "def3048ee9f83f35defb7afa04376ace7beb2c38b198e98b76779f98793f9342"
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
