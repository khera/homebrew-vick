require 'formula'

class Bfgminer < Formula
  homepage 'https://github.com/luke-jr/bfgminer'
  url 'http://luke.dashjr.org/programs/bitcoin/files/bfgminer/3.1.1/bfgminer-3.1.1.tbz2'
  head 'https://github.com/luke-jr/bfgminer.git', :using => :git
  sha1 '826194510747fd40082c0820ab5bb11818e3a86d'

  option 'with-scrypt', 'Build with scrypt support'

  depends_on 'libtool' => :build
  depends_on 'pkg-config' => :build
  depends_on 'jansson'
  depends_on 'curl'
  depends_on 'uthash'

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

    args << "--with-scrypt" if build.include? 'with-scrypt'

    system "./configure", *args
    system "make install"
  end

end
