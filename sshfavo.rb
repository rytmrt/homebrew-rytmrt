require 'formula'

HOMEBREW_SSHFAVO_VERSION='0.1.2'
class Sshfavo < Formula
  homepage 'https://github.com/rytmrt/sshfavo'
  url 'https://github.com/rytmrt/sshfavo.git', :tag => "v#{HOMEBREW_SSHFAVO_VERSION}"
  version HOMEBREW_SSHFAVO_VERSION
  head 'https://github.com/rytmrt/sshfavo.git', :branch => 'master'

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    system 'go', 'get', "github.com/BurntSushi/toml"
    system 'go', 'build', '-o', 'sshfavo'
    bin.install 'sshfavo'
  end
end
