class I586ElfGcc < Formula
  desc "GNU Compiler Collection targetting i586-elf"
  homepage "https://gcc.gnu.org"
  url "http://ftpmirror.gnu.org/gcc/gcc-7.3.0/gcc-7.3.0.tar.xz"
  version "7.3.0"
  sha256 "832ca6ae04636adbb430e865a1451adf6979ab44ca1c8374f61fba65645ce15c"

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

end
