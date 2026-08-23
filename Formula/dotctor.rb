class Dotctor < Formula
  desc "A CLI tool to diagnose your dotfiles health"
  homepage "https://github.com/nozomi-koborinai/dotctor"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/dotctor/releases/download/v0.2.0/dotctor-aarch64-apple-darwin.tar.xz"
      sha256 "b75f53b825a97c1f47f47aebb3749e015309c1499088ab0f07f3e2be9fe94389"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nozomi-koborinai/dotctor/releases/download/v0.2.0/dotctor-x86_64-apple-darwin.tar.xz"
      sha256 "a56bcbfec21f3a01e6258b5fe2840327a22886c97e3cd63b275423f8a05637b5"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/nozomi-koborinai/dotctor/releases/download/v0.2.0/dotctor-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "98701508f53ad7fc004f54fb9d58e666c641eb0e0711ed3aaacae7b7b8d481f0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/nozomi-koborinai/dotctor/releases/download/v0.2.0/dotctor-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d9ef47a00efef58b91cac2f61f29a2ed94fa87406503a5404671c7fe085c1b82"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "dotctor"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "dotctor"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "dotctor"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "dotctor"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
