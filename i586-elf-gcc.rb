require 'formula'

class I586ElfGcc < Formula
  homepage "http://gcc.gnu.org"
#  url "http://ftpmirror.gnu.org/gcc/gcc-5.3.0/gcc-5.3.0.tar.bz2"
#  mirror "ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.3.0/gcc-5.3.0.tar.bz2"
#  sha256 "b84f5592e9218b73dbae612b5253035a7b34a9a1f7688d2e1bfaaf7267d5c4db"
  url "http://ftpmirror.gnu.org/gcc/gcc-5.2.0/gcc-5.2.0.tar.bz2"
  mirror "https://ftp.gnu.org/gnu/gcc/gcc-5.2.0/gcc-5.2.0.tar.bz2"
  sha256 "5f835b04b5f7dd4f4d2dc96190ec1621b8d89f2dc6f638f9f8bc1b1014ba8cad"

  depends_on 'gmp'
  depends_on 'libmpc'
  depends_on 'mpfr'
  depends_on 'i586-elf-binutils'
  depends_on 'cloog'
  depends_on 'isl'

  def install
    binutils = Formulary.factory 'i586-elf-binutils'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=i586-elf',
                             "--prefix=#{prefix}",
                             "--enable-languages=c",
                             "--with-gmp=#{Formula["gmp"].opt_prefix}",
                             "--with-mpc=#{Formula["mpc"].opt_prefix}",
                             "--with-mpfr=#{Formula["mpfr"].opt_prefix}",
                             "--with-cloog=#{Formula["cloog"].opt_prefix}",
                             "--with-isl=#{Formula["isl"].opt_prefix}",
                             "--with-system-zlib",
                             "--disable-werror",
                             "--without-headers"
      system 'make all-gcc'
      system 'make install-gcc'
      FileUtils.ln_sf binutils.prefix/"i586-elf", prefix/"i586-elf"
      system 'make all-target-libgcc'
      system 'make install-target-libgcc'
      FileUtils.rm_rf share/"man"/"man7"
    end
  end
end
