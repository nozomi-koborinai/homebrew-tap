# typed: false
# frozen_string_literal: true

cask "clb" do
  name "clb"
  desc "Run local Cursor CLI agents with a cloud-agent-shaped lifecycle"
  homepage "https://github.com/nozomi-koborinai/cursor-local-bridge"
  version "0.1.0"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "clb"

  on_macos do
    on_intel do
      url "https://github.com/nozomi-koborinai/cursor-local-bridge/releases/download/v#{version}/clb_#{version}_darwin_amd64.tar.gz"
      sha256 "de9f79c1351424104fe95fbeb4632f48786797935bdded103d8bb4cce2b491ec"
    end
    on_arm do
      url "https://github.com/nozomi-koborinai/cursor-local-bridge/releases/download/v#{version}/clb_#{version}_darwin_arm64.tar.gz"
      sha256 "59ee1797e252349960dad57fd508125af6062790629c983ce305e92465b00392"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nozomi-koborinai/cursor-local-bridge/releases/download/v#{version}/clb_#{version}_linux_amd64.tar.gz"
      sha256 "072cb308410f2a35ec71ad6d620590eab34212f5e96db726c0388678c9510e4a"
    end
    on_arm do
      url "https://github.com/nozomi-koborinai/cursor-local-bridge/releases/download/v#{version}/clb_#{version}_linux_arm64.tar.gz"
      sha256 "213f724cf3efbf26c341996d0e100ed2e98dbe47fad0fdf5ff9bde728db584c0"
    end
  end

  postflight do
    on_macos do
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/clb"]
    end
  end
end
