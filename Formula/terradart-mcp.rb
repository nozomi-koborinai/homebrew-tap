class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.25.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.1/terradart-mcp-darwin-arm64"
      sha256 "bfc9d6e73891bfb94446f8f10ab3fb448dda21a49e9fe8e5480d7b427c8ccad2"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.1/terradart-mcp-darwin-amd64"
      sha256 "3c37cfa185ff57528fa976a38459566923880251d000e2622c60051e4a8989da"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.1/terradart-mcp-linux-amd64"
    sha256 "7df2c7a4101f719cf07a4b0563681266d6b340d0ba828577fc3d15e6c87d35d9"
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
