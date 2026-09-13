class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.28.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.1/terradart-mcp-darwin-arm64"
      sha256 "f7cf464d4bf7397d7f97208c02cd155ec05a28664ba2ab8f0981a37d917f2b85"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.1/terradart-mcp-darwin-amd64"
      sha256 "883dc35c2ed1bf7d9ccf10b340933bbbb19c97221aa3c32932bef114ae04cc6e"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.28.1/terradart-mcp-linux-amd64"
    sha256 "03ed566fd8267013a4d2a9634a6dad75ad68c3a9c31fd70b584fce41ae4c4a14"
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
