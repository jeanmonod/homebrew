require 'formula'

class Play2 < Formula
  homepage 'http://www.playframework.org/2.0'
  url 'http://download.playframework.org/releases/play-2.0-RC3.zip'
  md5 '0767d7b9bdf98dcfac2294f1d3036755'

  def install

    # remove windows command file
    rm Dir['play.bat'] # remove windows command file

    # Update the local folder var, as the current script doesn't allow
    #  to be reference by relative symlinks
    # More info here: https://play.lighthouseapp.com/projects/82401/tickets/43-play-shell-script-doesnt-work-when-symlinked
    inreplace 'play', 'dir=`dirname $PRG`', "dir=#{prefix}/libexec"

    libexec.install Dir['*']
    bin.install_symlink libexec+'play'
  end
end
