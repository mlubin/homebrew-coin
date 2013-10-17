require 'formula'

class Ipopt < Formula
  homepage 'https://projects.coin-or.org/Ipopt'
  url 'http://www.coin-or.org/download/source/Ipopt/Ipopt-3.11.4.tgz'
  sha1 '909a7073e3e83989d1a8c5aceba2d1a96dc262d2'

  depends_on :fortran

  def patches
    # Patch to properly list shared library dependencies: 
    # https://projects.coin-or.org/BuildTools/ticket/105
    { :p1 => "https://raw.github.com/mlubin/Ipopt.jl/6c4131cea941c327e85a15135926dc0a17648646/deps/ipopt-shlibs.patch"
    }
  end

  def install
    system "cd ThirdParty/Mumps; ./get.Mumps"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    ENV.deparallelize  # make install fails in parallel.
    system "make install"

  end
end
