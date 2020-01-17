class Upterm < Formula
  desc "Secure terminal sharing"
  homepage "https://upterm.dev"
  url "https://github.com/jingweno/upterm/archive/v0.0.9.tar.gz"
  sha256 "054048e42d94a4699285191d592733789ec8779fc1912a782c565ab7c47206c4"
  head "https://github.com/jingweno/upterm.git"

  depends_on "go" => :build

  def install
    system "make", "build"
    bin.install "build/upterm"

    prefix.install_metafiles

    bash_completion.install "etc/completion/upterm.bash_completion.sh"
    zsh_completion.install "etc/completion/upterm.zsh_completion" => "_upterm"

    man.install "etc/man/man1"
  end

  test do
    assert_match(/upterm version 0.0.9/, shell_output("#{bin}/upterm version"))
  end
end
