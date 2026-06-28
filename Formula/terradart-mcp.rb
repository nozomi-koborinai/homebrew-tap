class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.21.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.21.0/terradart-mcp-darwin-arm64"
      sha256 "3dd6a8185f5cc7741ab57fd71a8e1a59be5fc59e3a832320a25063158abc0f6e"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.21.0/terradart-mcp-darwin-amd64"
      sha256 "10c2624050e0eb346150102c4a1856f6d7b19902408c81a329e5b90481142d8b"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.21.0/terradart-mcp-linux-amd64"
    sha256 "5f41df62305a0729f8ce3f36e384f14741125e4bd5854e2b3d1e8d72d68fa75f"
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
