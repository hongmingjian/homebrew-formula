require 'formula'

class I586ElfGdb < Formula
  homepage "https://www.gnu.org/software/gdb/"
  url "http://ftpmirror.gnu.org/gdb/gdb-7.11.tar.xz"
  mirror "https://ftp.gnu.org/gnu/gdb/gdb-7.11.tar.xz"
  sha256 "7a434116cb630d77bb40776e8f5d3937bed11dea56bafebb4d2bc5dd389fe5c1"

  depends_on 'i586-elf-binutils'
  depends_on 'i586-elf-gcc'
  depends_on 'xz'
  depends_on 'readline'

  def install
    mkdir 'build' do
      system '../configure', '--target=i586-elf', "--prefix=#{prefix}",
             '--disable-debug',
             '--disable-dependency-tracking',
             '--with-system-readline'
      system 'make'
      system 'make install'
      FileUtils.rm_rf share/"locale"
      FileUtils.rm_rf share/"info"
    end
  end
end
