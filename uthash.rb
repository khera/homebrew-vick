require 'formula'

class Uthash < Formula
  homepage 'http://troydhanson.github.io/uthash/'
  url 'https://github.com/troydhanson/uthash/archive/master.zip'
  version '1.9.8'
  sha1 '578cb3ff16241ecbbf4ce015e6ba9652d90c1f4b'

  def install
    include.install Dir['src/*.h']
  end
end
