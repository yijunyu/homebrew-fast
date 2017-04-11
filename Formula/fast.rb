class Fast < Formula
  desc "Flattening Abstract Syntax Trees"
  homepage "https://github.com/yijunyu/fast"
  url "https://github.com/yijunyu/fast/archive/v0.0.1.tar.gz"
  sha256 "0dafb2bc3530932c62685e637abcd4087544d8c63620d5887f1edabc15d369b5"

  bottle do
    root_url "https://github.com/yijunyu/fast/releases/download/v0.0.1"
    cellar :any
    sha256 "bbbddff2d704dc8b7c81db44f6851b5cf9b80892eeb0f7056161e4f966d61e32" => :sierra
  end

  depends_on "cmake" => :build
  depends_on "flatbuffers" => :build
  depends_on "pkg-config" => :build
  depends_on "protobuf" => :build
  depends_on "srcml"

  def install
    system "cmake", "-G", "Unix Makefiles", *std_cmake_args
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
