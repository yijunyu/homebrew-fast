class Prism < Formula
  desc "Probabilistic Model Checker"
  homepage "http://www.mrmc-tool.org/"
  url "https://github.com/yijunyu/homebrew-fast/raw/master/src/prism-4.3.1.tar.gz"
  sha256 "6af7cfc37605bf48421a0c436e8006d25df23a6660f14a9c360d830da1bd9a94"

  def install
    system "make"
    system "make", "install"
  end

  patch :DATA

  test do
    system bin/"prism", "-v"
  end
end
__END__
diff -r -u a/Makefile b/Makefile
--- a/Makefile	2016-08-10 18:23:18.000000000 +0100
+++ b/Makefile	2017-04-04 18:28:34.000000000 +0100
@@ -2,10 +2,16 @@
 #  Small makefile for building PRISM source distributions  #
 ############################################################
 
+prefix=${HOMEBREW_FORMULA_PREFIX}
+
 default: none
 
 none:
-	@echo 'Did you want to build PRISM? Do "cd prism" and then "make"'
+	cd prism; make
+
+install:
+	mkdir -p $(prefix)/bin
+	install -m 0755 bin/prism $(prefix)/bin/prism
 
 # By default, extract version number from Java code using printversion
 # Can be overridden by passing VERSION=xxx
