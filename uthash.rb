require 'formula'

class Uthash < Formula
  homepage 'http://troydhanson.github.io/uthash/'
  url 'https://github.com/troydhanson/uthash/archive/v1.9.8.zip'
  version '1.9.8'
  sha1 '53e05e0c4dea79fc736fcefbcbec5c4d456e9a78'

  def install
    include.install Dir['src/*.h']
  end
end
