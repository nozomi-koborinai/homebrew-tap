class TerradartMcp < Formula
  desc "MCP server exposing the curated GCP factory catalog of TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.12.0"
  license "Apache-2.0"

  on_macos do
    # Apple Silicon only for v0.12.0. An Intel (x86_64) macOS build is planned
    # for a follow-up release; Dart has no cross-compile, so it needs an Intel
    # (or Rosetta) build that the scarce macOS-13 CI runner could not provide.
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.12.0/terradart-mcp-darwin-arm64"
      sha256 "2a6b74fdc8079014374d3568599eb6f7edb42dd5e2bf2257e9110967776f7c11"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.12.0/terradart-mcp-linux-amd64"
    sha256 "1b1e049604d89d173b262b33969f72df46ad87974e14f2248977fbbfab5620f8"
  end

  def install
    if OS.mac?
      bin.install "terradart-mcp-darwin-arm64" => "terradart-mcp"
    else
      bin.install "terradart-mcp-linux-amd64" => "terradart-mcp"
    end
  end

  test do
    assert_match "terradart-mcp #{version}", shell_output("#{bin}/terradart-mcp --version")
  end
end
