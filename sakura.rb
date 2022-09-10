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
  depends_on :x11

#  patch do
#    url "https://example.com/example_patch.diff"
#    sha256 "85cc828a96735bdafcf29eb6291ca91bac846579bcef7308536e0c875d6c81d7"
#  end

  def install
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}",
           "."
    system "make"#, "install"
  end
end

