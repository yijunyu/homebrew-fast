class Fast < Formula
  desc "Flattening Abstract Syntax Trees"
  homepage "https://github.com/yijunyu/fast"
  url "https://github.com/yijunyu/fast/archive/v0.0.1.tar.gz"
  sha256 "9d26869b7d4270b85458742c2908d241bd797220fef4ecc3980c1a91c4ce9ad6"

  bottle do
    root_url "https://github.com/yijunyu/fast/releases/download/v0.0.1"
    cellar :any
    sha256 "" => :sierra
    sha256 "bb4aea4874809435686701fb81524e54b95f6ad647f59b36b483748c26ad951a" => :el_capitan
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
