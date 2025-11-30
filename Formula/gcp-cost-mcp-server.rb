class GcpCostMcpServer < Formula
  desc "MCP server for estimating Google Cloud running costs"
  homepage "https://github.com/nozomi-koborinai/gcp-cost-mcp-server"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/gcp-cost-mcp-server/releases/download/v0.5.0/gcp-cost-mcp-server-darwin-arm64"
      sha256 "a5631f26dedf63c6371100fb20d8cd9c2bc1430e60a95ed502fbc32d4e18bc75"
    else
      url "https://github.com/nozomi-koborinai/gcp-cost-mcp-server/releases/download/v0.5.0/gcp-cost-mcp-server-darwin-amd64"
      sha256 "6c5532eaff9b141a08c5b0d2f5f043e2d65bf16b3e7e51fc188cee5a310e94d8"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/gcp-cost-mcp-server/releases/download/v0.5.0/gcp-cost-mcp-server-linux-amd64"
    sha256 "7c17de4334dcc3376dab3fb59ce370cbdc46bb71783e6265625202bea51da822"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "gcp-cost-mcp-server-darwin-arm64" => "gcp-cost-mcp-server"
      else
        bin.install "gcp-cost-mcp-server-darwin-amd64" => "gcp-cost-mcp-server"
      end
    else
      bin.install "gcp-cost-mcp-server-linux-amd64" => "gcp-cost-mcp-server"
    end
  end

  test do
    # The binary exits with code 1 when run without proper MCP client
    # Just verify it's executable
    assert_predicate bin/"gcp-cost-mcp-server", :executable?
  end
end
