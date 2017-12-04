class Goss < Formula
  desc "Quick and Easy server testing/validation"
  homepage "https://goss.rocks/"
  url "https://github.com/aelsabbahy/goss/archive/v0.3.5.tar.gz"
  sha256 "e6d8466d2d43f0c65ff039f44271fde3e11312731989ccf19bdf510db359340a"

  bottle :unneeded

  depends_on "go" => :build
  depends_on "glide" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"
    ENV.prepend_create_path "PATH", buildpath/"bin"

    dir = buildpath/"src/github.com/aelsabbahy/goss"
    dir.install buildpath.children - [buildpath/".brew_home"]

    cd dir do
      system "make", "deps"
      system "make", "release/goss-linux-amd64"
      inreplace "extras/dgoss/dgoss", "GOSS_PATH=", "GOSS_PATH=/usr/local/bin/goss-linux-amd64"
      bin.install "release/goss-linux-amd64"
      bin.install "extras/dgoss/dgoss"
      prefix.install_metafiles
    end
  end

end
