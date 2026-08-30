class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.27.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.27.0/terradart-mcp-darwin-arm64"
      sha256 "d088fe6a80ca8842d9cf4927ae9a4fe0b25a46b395b525e394819901f629b847"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.27.0/terradart-mcp-darwin-amd64"
      sha256 "e746ccbd96567c0a1ad8218d28a014341c488cd330d8deff42e0e21df369c7de"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.27.0/terradart-mcp-linux-amd64"
    sha256 "572ebcc6c480557db838d80c3c10336ccbeaa2f19caae1ad28967f553df51de1"
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
