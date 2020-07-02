cask 'soundnode' do
  version "7.0.0"
  sha256 "bada00a3977dace63137e6854465cba213feab5a08bd628d9fa2710f68f01693"

  url "https://github.com/Soundnode/soundnode-app/releases/download/#{version}/Soundnode-darwin-x64.tar.xz"
  name 'Soundnode'
  homepage 'http://www.soundnodeapp.com/'

  app 'Soundnode-darwin-x64/Soundnode.app'

  zap trash: [
               '~/Library/Application Support/Soundnode',
               '~/Library/Preferences/com.nw-builder.soundnode.plist',
               '~/Library/Saved Application State/com.nw-builder.soundnode.savedState',
             ]
end
