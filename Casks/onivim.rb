cask 'onivim' do
  version '0.3.2'
  sha256 '86f45c6e933f128402a48ec4e62028acd0a4e2e90b6d17f6bb5db08bd9ac8fff'

  url "https://github.com/onivim/oni/releases/download/v#{version}/Oni-#{version}-osx.dmg"
  name 'OniVim'
  homepage '://https://www.onivim.io'
  license :oss

  app 'Oni.app'
end
