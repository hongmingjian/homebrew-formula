require 'formula'

class I586ElfBinutils < Formula
  homepage "http://www.gnu.org/software/binutils/binutils.html"
  url "http://ftpmirror.gnu.org/binutils/binutils-2.26.tar.gz"
  mirror "http://ftp.gnu.org/gnu/binutils/binutils-2.26.tar.gz"
  sha1 "bb933ec42eb2002d9270bd4c62a26c3706589ee9"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--infodir=#{info}",
                          "--mandir=#{man}",
                          "--target=i586-elf",
                          "--disable-werror",
                          "--enable-interwork"
    system "make"
    system "make", "install"
    FileUtils.rm_rf share
  end

end
