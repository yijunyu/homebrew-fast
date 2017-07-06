class Fast < Formula
  desc "Flattening Abstract Syntax Trees"
  homepage "https://github.com/yijunyu/fast"
  url "https://github.com/yijunyu/fast/archive/v0.0.3.tar.gz"
  sha256 "7e47ddd4d7f14593df8918b3de8f545cc7462fd1d49fe483e88264f72f810d72"

  bottle do
    root_url "https://github.com/yijunyu/fast/releases/download/v0.0.3"
    cellar :any
    sha256 "" => :sierra
    sha256 "d2f5da15b0d42d76a0d7492d12403e3476b1ff8977b2aae69188172e92d57436" => :el_capitan
  end

  depends_on "flatbuffers" => :build
  depends_on "pkg-config" => :build
  depends_on "protobuf" => :build
  depends_on "srcml" => :run
  depends_on "libxml2"
  depends_on "antlr" => :build
  depends_on "antlr4-cpp-runtime" => :build
  depends_on "lcov"

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
