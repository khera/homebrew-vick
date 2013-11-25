require 'formula'

class Bfgminer < Formula
  homepage 'https://github.com/luke-jr/bfgminer'
  url 'http://luke.dashjr.org/programs/bitcoin/files/bfgminer/3.6.0/bfgminer-3.6.0.tbz2'
  head 'https://github.com/luke-jr/bfgminer.git', :using => :git
  sha1 '4ed45b3976b103a3d033d5f59699ef5441c930a5'

  option 'with-scrypt', 'Build with scrypt support'

  depends_on 'libtool' => :build
  depends_on 'pkg-config' => :build
  depends_on 'jansson'
  depends_on 'curl'
  depends_on 'uthash' => :build

  depends_on 'libusb' => :optional
  option 'with-libusb', 'Build with libusb (for ZTEX/X6500 FPGAs) support'

  if build.head?
    depends_on :autoconf
    depends_on :automake
  end

  def install
    system "./autogen.sh" if build.head?

    args = %W[
      --prefix=#{prefix}
    ]

    args << "--enable-scrypt" if build.include? 'with-scrypt'

    system "./configure", *args
    system "make install"
  end

end
