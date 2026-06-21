class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.17.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.17.1/terradart-mcp-darwin-arm64"
      sha256 "ddf3cfff8e4c6d4cf87f3400b2bf57ac583795c0c56d881fea4c38ec57c0f49e"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.17.1/terradart-mcp-darwin-amd64"
      sha256 "a379a7dc2d760a0f8c4a3e05e91047f54b689f6d29c6193355eb5629250cb23a"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.17.1/terradart-mcp-linux-amd64"
    sha256 "a2eb957400e26262662f2d313816b8f929e260434e52ed805cdaaf343308683c"
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
