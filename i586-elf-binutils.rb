class I586ElfBinutils < Formula
  desc "GNU Binutils targetting i586-elf"
  homepage "https://www.gnu.org/software/binutils/"
  url "http://mirrors.ustc.edu.cn/gnu/binutils/binutils-2.37.tar.xz"
  version "2.37"
  sha256 "820d9724f020a3e69cb337893a0b63c2db161dadcb0e06fc11dc29eb1e84a32c"

  def install
    mkdir "binutils-build" do
      system "../configure", "--prefix=#{prefix}",
                             "--target=i586-elf",
                             "--disable-multilib",
                             "--disable-nls",
                             "--disable-werror"
      system "make"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/i586-elf-as", "--version"
  end
end
