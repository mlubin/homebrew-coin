require 'formula'

class Nlopt < Formula
  homepage 'https://projects.coin-or.org/Ipopt'
  url 'http://ab-initio.mit.edu/nlopt/nlopt-2.4.tar.gz'
  sha1 'e766f4c49fa5923fb45220f278c01c04c38fc369'

  def install
    system "./configure", "--enable-shared",
                          "--without-guile",
                          "--without-python",
                          "--without-octave",
                          "--without-matlab",
                          "--with-cxx",
                          "--prefix=#{prefix}"
    system "make"
    ENV.deparallelize  # make install fails in parallel.
    system "make install"

  end
end
