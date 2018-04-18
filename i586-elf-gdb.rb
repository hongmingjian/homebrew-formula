class I586ElfGdb < Formula
  desc "GNU Project Debugger targetting i586-elf"
  homepage "https://www.gnu.org/software/gdb/"
  url "http://mirrors.ustc.edu.cn/gnu/gdb/gdb-8.1.tar.xz"
  version "8.1"
  sha256 "af61a0263858e69c5dce51eab26662ff3d2ad9aa68da9583e8143b5426be4b34"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--target=i586-elf",
                          "--program-prefix=i586-elf-",
                          "--disable-werror"

    system "make"
    system "make", "install"

    # Conflict with i586-elf-binutils
    FileUtils.rm_rf "#{prefix}/share/info"
    FileUtils.rm_rf "#{prefix}/share/locale"
  end

end
