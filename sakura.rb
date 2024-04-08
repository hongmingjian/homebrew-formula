class Sakura < Formula
  desc "GTK/VTE based terminal emulator"
  homepage "https://launchpad.net/sakura"
  url "https://github.com/dabisu/sakura/archive/refs/tags/SAKURA_3_8_7.zip"
  version "3.8.7"
  sha256 "5f29b142e9233d2fdc18e4bc9d15fbc2c1c3d386c9330d91954228fc7e1144ab"

  depends_on "cmake" => :build
  depends_on "pkg-config"
  depends_on "vte3"

  patch do
    url "https://raw.githubusercontent.com/hongmingjian/homebrew-formula/549d8cfe59573bc1d183a3565d0e3a858f946865/sakura-3.8.5.patch"
    sha256 "3d36058990c864b8eca618557229503f99bc2d36ee0982285a7b7167e5503a11"
  end

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end
end
