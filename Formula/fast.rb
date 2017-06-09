class Fast < Formula
  desc "Flattening Abstract Syntax Trees"
  homepage "https://github.com/yijunyu/fast"
  url "https://github.com/yijunyu/fast/archive/v0.0.1.tar.gz"
  sha256 "2893ce1eae40a7b71773e9c7959f52be97873748fc0538fdb0d280ab653cbfb7"

  bottle do
    root_url "https://github.com/yijunyu/fast/releases/download/v0.0.1"
    cellar :any
    sha256 "097a0d9bb1ab41b80e18591e861abeb6f397d3b93eae261dfa73bafd77eab789" => :sierra
    sha256 "3dbc1b3e42ca6db9c8711b205770c9224aebc30df50a222a2432385e962e2a96" => :el_capitan
  end

  depends_on "flatbuffers" => :build
  depends_on "pkg-config" => :build
  depends_on "protobuf" => :build
  depends_on "srcml"

  def install
    args = [
      "--prefix=#{prefix}",
    ]
    system "./configure", *args
    system "make"
    system "make", "install"
  end

  test do
    (testpath/"Hello.java").write <<-EOS

public class Hello {
    public static void main(String args[]) {
        System.out.println("Hello, world!");
    }
}
    EOS

    exec "#{bin}/fast", "Hello.java", "Hello.pb"
  end
end
