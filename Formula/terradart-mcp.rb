class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.22.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.22.0/terradart-mcp-darwin-arm64"
      sha256 "c0881c744fc2afdfa62bf249d88b429abb788c6fbad78eb1ab0fbf1242a51fba"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.22.0/terradart-mcp-darwin-amd64"
      sha256 "ed8e4bc5169e3cf49cd4e05c778c3ad5f5e7bb6cf0a0e1ba765d4285eab6e895"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.22.0/terradart-mcp-linux-amd64"
    sha256 "41b59dea95c498e338183442595648d8a870ad15e8a9db9ecc622f41a48b499f"
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
