require 'formula'

class Uthash < Formula
  homepage 'http://troydhanson.github.io/uthash/'
  url 'https://github.com/troydhanson/uthash/archive/v1.9.8.zip'
  version '1.9.8'
  sha1 '2a6c33c0cd5f7c9932297ed12e2c763636465135'

  def install
    include.install Dir['src/*.h']
  end
end
