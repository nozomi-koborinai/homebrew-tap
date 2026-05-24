class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.12.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.12.1/terradart-mcp-darwin-arm64"
      sha256 "b0215833d2b6b7df19f9fc73fa622f4b23f1be5176460cf2b93d7686ef278bff"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.12.1/terradart-mcp-darwin-amd64"
      sha256 "cda66953fe766f4340b661403aeb071552e031036fa3b491cb4dd2f6ec87a0ac"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.12.1/terradart-mcp-linux-amd64"
    sha256 "ab490269b2cfd27cae952b700148e54cf8b82671b4081ae513a619fbf6c0b633"
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
    assert_match "terradart-mcp #{version}", shell_output("#{bin}/terradart-mcp --version")
  end
end
