class I586ElfGcc < Formula
  desc "GNU Compiler Collection targetting i586-elf"
  homepage "https://gcc.gnu.org"
  url "http://mirrors.ustc.edu.cn/gnu/gcc/gcc-12.2.0/gcc-12.2.0.tar.xz"
  version "12.2.0"
  sha256 "e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4181e06926230ff"

  depends_on "gmp" => :build
  depends_on "i586-elf-binutils"
  depends_on "libmpc"
  depends_on "mpfr" => :build

  def install
    mkdir "gcc-build" do
      system "../configure", "--prefix=#{prefix}",
                             "--target=i586-elf",
                             "--disable-multilib",
                             "--disable-nls",
                             "--disable-werror",
                             "--without-headers",
                             "--without-isl",
                             "--enable-languages=c"

      system "make", "all-gcc"
      system "make", "install-gcc"
      system "make", "all-target-libgcc"
      system "make", "install-target-libgcc"

      # GCC needs this folder in #{prefix} in order to see the binutils.
      # It doesn't look for i586-elf-as on $PREFIX/bin. Rather, it looks
      # for as on $PREFIX/$TARGET/bin/ ($PREFIX/i586-elf/bin/as).
      binutils = Formula["i586-elf-binutils"].prefix
      FileUtils.ln_sf "#{binutils}/i586-elf", "#{prefix}/i586-elf"
    end
  end

  test do
    # should try to compile something?
    system "#{bin}/i586-elf-gcc", "--version"
  end
end
