# Based on https://github.com/mistydemeo/homebrew-xfig
class Xfig < Formula
  desc "Interactive drawing tool for X"
  homepage "https://xfig.org"
  url "https://downloads.sourceforge.net/project/mcj/xfig-3.2.7b.tar.xz"
  sha256 "bbc1c4aa8eb7fc06559a5bf83c4798f022be413519778a5d5cdccd24f39a0bce"

  depends_on "fig2dev"
  depends_on "jpeg"
  depends_on "libx11"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--disable-dependency-tracking",
                          "--without-xfig-libraries",
                          "--disable-silent-rules"
    system "make", "install"
  end

  test do
    assert_match "Xfig #{version}", shell_output("#{bin}/xfig -v 2>&1")
  end
end
