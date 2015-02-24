require "formula"

class Helios < Formula
  homepage "https://github.com/spotify/helios"
  url "https://oss.sonatype.org/service/local/repositories/releases/content/com/spotify/helios-tools/0.8.188/helios-tools-0.8.188-shaded.jar"
  sha1 "b703c11832657b9bdbf18135a77963efd4598d5e"
  version "0.8.188"

  depends_on :java => "1.7"

  def install
    libexec.install "helios-tools-0.8.188-shaded.jar"
    bin.write_jar_script libexec/"helios-tools-0.8.188-shaded.jar", "helios", "-XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xverify:none"
  end

  test do
    system "#{bin}/helios", "--version"
  end
end