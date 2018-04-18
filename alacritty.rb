class Alacritty < Formula
  desc "A cross-platform, GPU-accelerated terminal emulator"
  homepage "https://github.com/jwilm/alacritty"
  url "https://github.com/jwilm/alacritty/archive/master.zip"
  version 'latest'
  sha256 "f1e1ca012d01966781e7e890a30d35d24cc7165de8118af1d07c7c832e20c90e"

  bottle :unneeded

  depends_on "rust" => :build

  def install
    system "make", "app"
    bin.install "target/release/osx/Alacritty.app/Contents/MacOS/alacritty"
    prefix.install "target/release/osx/Alacritty.app"
  end

  def caveats
  <<~EOS
      Alacritty is currently HEAD only and as such no casks are supported.
      Link the generated macOS application
      cp -r "/usr/local/Cellar/alacritty/latest/Alacritty.app" /Applications/
    EOS
  end

end
