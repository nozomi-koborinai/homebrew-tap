class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.17.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.17.0/terradart-mcp-darwin-arm64"
      sha256 "7adf71c4eaa863b275201d7722156aaf9ce4a3b6a3c7c76e9dd0705c1f06033a"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.17.0/terradart-mcp-darwin-amd64"
      sha256 "779c897138f739a19d67b3b9e7426997c7cf016cced452918aa317f7e9c9d97b"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.17.0/terradart-mcp-linux-amd64"
    sha256 "9f2549e9ebd0840d59daafe6dcd6f80175ea23613d86c3e970ffbcad4b8438e0"
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
