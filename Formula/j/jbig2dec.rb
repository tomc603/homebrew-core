class Jbig2dec < Formula
  desc "JBIG2 decoder and library (for monochrome documents)"
  homepage "https://github.com/ArtifexSoftware/jbig2dec"
  url "https://github.com/ArtifexSoftware/jbig2dec/archive/refs/tags/0.19.tar.gz"
  sha256 "e81b787ad0b147a437a52d9ce7de1a8f429655e8aa030383b6b2dd8919373717"
  license "AGPL-3.0-or-later"

  bottle do
    sha256 cellar: :any,                 arm64_sonoma:   "84bcc256a4208ea0f93b5bdaa04c465334c1f4abce3932fb9d7072df690ee84f"
    sha256 cellar: :any,                 arm64_ventura:  "fd976897a71bad7195c7a248a9d12183dfb93c5e42f2a82cce542987cf3c4fec"
    sha256 cellar: :any,                 arm64_monterey: "e15376f42a9d9372fffaaf07d739458a0af5870b2ddb2f5ce91e4d88b865daf2"
    sha256 cellar: :any,                 arm64_big_sur:  "696d6862655e2919c4a6b1455923c2c26b3b9da7968aa2a6f6c0b544d10556f0"
    sha256 cellar: :any,                 sonoma:         "ff603d16d82cd51d5a797d43661a2ecaa4ee21065c7cfeba3556f539683cdec9"
    sha256 cellar: :any,                 ventura:        "bd449679c84d98abb9925714c102337b64ef17634c2276c639921f09ee8f432a"
    sha256 cellar: :any,                 monterey:       "e1aed32e74617b0638751e69489b38dbcabd584f23961390a818bb85b412ffcd"
    sha256 cellar: :any,                 big_sur:        "44aa9639d58ac2e176c37538c3fe652e077bcbf82264b756b4ba9db041e9273c"
    sha256 cellar: :any,                 catalina:       "7e70d2b2472b4116d1f98b7518f124067dbfa8e4d3d73b552af38440e7770bdd"
    sha256 cellar: :any,                 mojave:         "d02d163a886d1f3a9e1af50418ed2f19f66981b44a58f3228b3580f585929ee4"
    sha256 cellar: :any,                 high_sierra:    "8ec515805d2fab8f4db3b27afba0363428f341bb16fbda7d2708ef44fffc5285"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "5653cc9180b808ea6a60c11e6ef8fc76695e87ae47d5d1c6e6ed40070546f414"
  end

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  resource("test") do
    url "https://github.com/apache/tika/raw/master/tika-parsers/src/test/resources/test-documents/testJBIG2.jb2"
    sha256 "40764aed6c185f1f82123f9e09de8e4d61120e35d2b5c6ede082123749c22d91"
  end

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --disable-silent-rules
      --without-libpng
    ]

    system "./autogen.sh", *args
    system "make", "install"
  end

  test do
    resource("test").stage testpath
    output = shell_output("#{bin}/jbig2dec -t pbm --hash testJBIG2.jb2")
    assert_match "aa35470724c946c7e953ddd49ff5aab9f8289aaf", output
    assert_predicate testpath/"testJBIG2.pbm", :exist?
  end
end
