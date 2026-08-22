class TerradartCoverage < Formula
  desc "Terraform coverage checker for TerraDart"
  homepage "https://github.com/nozomi-koborinai/terradart"
  version "0.25.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.2/terradart-coverage-darwin-arm64"
      sha256 "27613042c4bf6c8cfa7c333282b8a0de30a14a8df6d25408274281ed3900ad33"
    else
      url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.2/terradart-coverage-darwin-amd64"
      sha256 "108740e699f78ebd776cd939ab51f6a8658a211bc9c523fe02d21107dab33cfc"
    end
  end

  on_linux do
    url "https://github.com/nozomi-koborinai/terradart/releases/download/v0.25.2/terradart-coverage-linux-amd64"
    sha256 "cb4d9ed1f6ba7b1f3cb0fa128e1d14dadaa5f79613319e9a5f8d205606e0be8e"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "terradart-coverage-darwin-arm64" => "terradart-coverage"
      else
        bin.install "terradart-coverage-darwin-amd64" => "terradart-coverage"
      end
    else
      bin.install "terradart-coverage-linux-amd64" => "terradart-coverage"
    end
  end

  test do
    assert_match "terradart-coverage", shell_output("#{bin}/terradart-coverage --help")
  end
end
