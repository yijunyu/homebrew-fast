class Gsl < Formula
  desc "Markov Reward Model Checker"
  homepage "http://www.mrmc-tool.org/"
  url "https://github.com/yijunyu/homebrew-fast/raw/master/src/mrmc-1.5.tar.gz"
  sha256 "b523ad316252e91e24f3dbecfe5a8124832e1b1881610bc1f7c33d5929274466"

  depends_on "gsl"

  def install
    system "make", "all"
  end

  test do
    system bin/"mrmc", "-h"
  end
end
_END
diff -r -u a/mrmc_src_v1.5/makefile b/mrmc_src_v1.5/makefile
--- a/mrmc_src_v1.5/makefile	2011-01-12 11:59:28.000000000 +0000
+++ b/mrmc_src_v1.5/makefile	2017-04-04 17:01:48.000000000 +0100
@@ -73,6 +73,14 @@
 all: bin lib
 	$(MAKE) -C obj $@
 
+DESTDIR=
+prefix=/usr/local
+
+install: 
+	mkdir -p $(DESTDIR)$(prefix)/bin
+	install -m 0755 bin/mrmc $(DESTDIR)$(prefix)/bin/mrmc
+	install -m 0755 lib/mrmc.a $(DESTDIR)$(prefix)/lib/mrmc.a
+
 lint:
 	$(MAKE) -C obj $@
 
