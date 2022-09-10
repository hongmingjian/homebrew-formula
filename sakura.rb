class Sakura < Formula
  desc "GTK/VTE based terminal emulator"
  homepage "https://launchpad.net/sakura"
  url "https://github.com/dabisu/sakura/archive/refs/tags/SAKURA_3_8_5.zip"
  version "3.8.5"
  sha256 "531101d4dafb21c1db62568a5b5b49159bddc6aad17baf0a2b81ced311e23454"

  depends_on "cmake" => :build
  depends_on "pkg-config"
  depends_on "vte3"
  depends_on "pcre2"
#  depends_on :x11

  patch do
    url "https://raw.githubusercontent.com/hongmingjian/sakura/master/sakura.patch"
    sha256 "3d36058990c864b8eca618557229503f99bc2d36ee0982285a7b7167e5503a11"
  end

  def install
    system "cmake", ".", *std_cmake_args
    system "make"#, "install"
  end
end

