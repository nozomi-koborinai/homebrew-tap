class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.20.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.20.0/terradart-mcp-darwin-arm64"
      sha256 "29c9cdb1f1fe29502be80799ad21b5dcbcefb0f580f7f59b623444704ff4cc9d"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.20.0/terradart-mcp-darwin-amd64"
      sha256 "e1f0265867ff75e9b3a55f99cfb009cc4770c97a8c6a97e919fd5b2a8fa4706e"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.20.0/terradart-mcp-linux-amd64"
    sha256 "2ef40eb97b69c59dd5e483f5a138deec039c5f3eb778866116e2cdb5cafce3ce"
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
