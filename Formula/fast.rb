class Fast < Formula
  desc "Flattening Abstract Syntax Trees"
  homepage "https://github.com/yijunyu/fast"
  url "https://github.com/yijunyu/fast/archive/v0.0.1.tar.gz"
  sha256 "5fc66b8840041ff6b56674a32eb0667a79487f5e71315dd55b2d21941093d702"

  bottle do
    root_url "https://github.com/yijunyu/fast/releases/download/v0.0.1"
    cellar :any
    sha256 "097a0d9bb1ab41b80e18591e861abeb6f397d3b93eae261dfa73bafd77eab789" => :sierra
    sha256 "3c81944b6fef74a4c8c2a794cb949a5f42a596a71082e5d4cc439f2d3f8fb0f4" => :el_capitan
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
