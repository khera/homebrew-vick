require 'formula'

class Jove < Formula
  homepage 'http://www.emacswiki.org/emacs/Jove'
  url 'ftp://ftp.cs.toronto.edu/cs/ftp/pub/hugh/jove-dev/jove4.16.0.73.tgz'
  sha1 'fca6f33465b08eed5b90e24cfb67e61bc5249dcf'

  def install
    inreplace "Makefile" do |s|
      s.change_make_var! "JOVEHOME", prefix
      s.change_make_var! "SHAREDIR", share
      s.change_make_var! "LIBDIR", libexec
      s.change_make_var! "MANDIR", man1
      s.change_make_var! "TMPDIR", '/var/tmp'
      s.change_make_var! "DFLTSHELL", '/bin/sh'
      s.change_make_var! "XINSTALL", '/usr/bin/install $(INSTALLFLAGS) -c -m 755'
      s.change_make_var! "TINSTALL", '/usr/bin/install $(INSTALLFLAGS) -c -m 644'
    end

    # getline() is a system function from stdio.h, so rename local function
    inreplace ["insert.c","io.c","io.h","recover.c","util.c","util.h"] do |s|
      s.gsub! "getline", "jgetline"
    end

    bin.mkdir
    share.mkdir
    libexec.mkdir
    man.mkdir
    man1.mkdir

    system "make", "all"
    system "make", "install"
  end

#  def patches
#    # Fix up install path locations
#    "http://gist.github.com/623/my.patch/raw/"
#  end


  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # Run the test with `brew test jove`.
    system "jove"
  end
end
