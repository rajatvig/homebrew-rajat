cask 'osxfuse' do
  version '3.0.9'
  sha256 '0065c58a352e014885ca472fdbe3ac703061d1fb32e4c682c7eb9a019ddf84c0'

  # sourceforge.net is the official download host per the vendor homepage
  url "https://github.com/osxfuse/osxfuse/releases/download/osxfuse-#{version}/osxfuse-#{version}.dmg"
  name 'OSXFUSE'
  homepage 'https://osxfuse.github.io/'
  license :bsd

  pkg "Extras/FUSE for OS X #{version}.pkg"

  uninstall :pkgutil => 'com.github.osxfuse.pkg.Core|com.github.osxfuse.pkg.PrefPane',
            :kext => 'com.github.osxfuse.filesystems.osxfusefs'

  postflight do
    set_ownership ['/usr/local/include', '/usr/local/lib']
  end

  caveats do
    reboot
  end
end
