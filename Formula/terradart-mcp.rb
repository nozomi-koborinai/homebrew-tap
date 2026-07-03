class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.24.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.24.0/terradart-mcp-darwin-arm64"
      sha256 "3c194d0e9d7cc1aceaea6546fad3cd847ef4ec9bdb7dd1e37a69cf97ca6b9d75"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.24.0/terradart-mcp-darwin-amd64"
      sha256 "9b193052d0c86dc440a8ae47047d890ea283122503acdd34b1ace5318cfe898a"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.24.0/terradart-mcp-linux-amd64"
    sha256 "059ca6aa8e763313457a7cac48ae1cee0c87cde7a9d4cca31c2611f0ef58125f"
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
