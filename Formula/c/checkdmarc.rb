class Checkdmarc < Formula
  include Language::Python::Virtualenv

  desc "Command-line parser for SPF and DMARC DNS records"
  homepage "https://domainaware.github.io/checkdmarc/"
  url "https://files.pythonhosted.org/packages/f7/31/65b2758cb4192c38c81d260b0459e10b17d8d2be64c5c37cec97580fea0f/checkdmarc-4.8.3.tar.gz"
  sha256 "07b61699deb7c2bc0231c565f4ed54d5c55444a5db9f0821dcdecf316fb33b00"
  license "Apache-2.0"
  head "https://github.com/domainaware/checkdmarc.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "8388de3d57a79fc6e661e5dc304b0351cde20a0dda04cb265ec1f55483613275"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "fcac4af44a5d893f21712f4c7de1fe0caec6f904955a33bd47202660614c6bea"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "6484761f998c4395a364db1f68529478e4d12afdc1d0dcffb7d9ac1d70e75185"
    sha256 cellar: :any_skip_relocation, ventura:        "1ce66e8a68dacce25ae15b5e2851897d793e279742aa8e62699746f85574a265"
    sha256 cellar: :any_skip_relocation, monterey:       "93606155d96975ea016242d1f50830aefb9355453bc4bb6eb0202cbfec7e9bbd"
    sha256 cellar: :any_skip_relocation, big_sur:        "9d281094380b572a6aa8607fa8a1202703cf8460104d1c9979fb0b70ca8b3cfc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "95159a0df50a7d3dcb0b2a349d21e2f9d50d32cc1efb64e64290b37bf08415b5"
  end

  depends_on "cffi"
  depends_on "pycparser"
  depends_on "python-certifi"
  depends_on "python-cryptography"
  depends_on "python@3.11"

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/2a/53/cf0a48de1bdcf6ff6e1c9a023f5f523dfe303e4024f216feac64b6eb7f67/charset-normalizer-3.2.0.tar.gz"
    sha256 "3bb3d25a8e6c0aedd251753a79ae98a093c7e7b471faa3aa9a93a81431987ace"
  end

  resource "dnspython" do
    url "https://files.pythonhosted.org/packages/65/2d/372a20e52a87b2ba0160997575809806111a72e18aa92738daccceb8d2b9/dnspython-2.4.2.tar.gz"
    sha256 "8dcfae8c7460a2f84b4072e26f1c9f4101ca20c071649cb7c34e8b6a93d58984"
  end

  resource "expiringdict" do
    url "https://files.pythonhosted.org/packages/fc/62/c2af4ebce24c379b949de69d49e3ba97c7e9c9775dc74d18307afa8618b7/expiringdict-1.2.2.tar.gz"
    sha256 "300fb92a7e98f15b05cf9a856c1415b3bc4f2e132be07daa326da6414c23ee09"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/8b/e1/43beb3d38dba6cb420cefa297822eac205a277ab43e5ba5d5c46faf96438/idna-3.4.tar.gz"
    sha256 "814f528e8dead7d329833b91c5faa87d60bf71824cd12a7530b5526063d02cb4"
  end

  resource "publicsuffixlist" do
    url "https://files.pythonhosted.org/packages/9a/eb/181211cfc95698c20c06744ce8f09b49180d257319a2d37cc8b33d3a60c6/publicsuffixlist-0.10.0.20230828.tar.gz"
    sha256 "7953dc8f580c63d6bc6678689f6944b3d10a5a0739e5ebb2bf3c67ae40c7d39a"
  end

  resource "pyleri" do
    url "https://files.pythonhosted.org/packages/0e/94/fa146d2de46b78237562373a2bb9277d69e4149738a11b69c1f42ca64c33/pyleri-1.4.2.tar.gz"
    sha256 "18b92f631567c3c0dc6a9288aa9abc5706a8c1e0bd48d33fea0401eec02f2e63"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/9d/be/10918a2eac4ae9f02f6cfe6414b7a155ccd8f7f9d4380d62fd5b955065c3/requests-2.31.0.tar.gz"
    sha256 "942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd6ad1e1"
  end

  resource "timeout-decorator" do
    url "https://files.pythonhosted.org/packages/80/f8/0802dd14c58b5d3d72bb9caa4315535f58787a1dc50b81bbbcaaa15451be/timeout-decorator-0.5.0.tar.gz"
    sha256 "6a2f2f58db1c5b24a2cc79de6345760377ad8bdc13813f5265f6c3e63d16b3d7"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/31/ab/46bec149bbd71a4467a3063ac22f4486ecd2ceb70ae8c70d5d8e4c2a7946/urllib3-2.0.4.tar.gz"
    sha256 "8d22f86aae8ef5e410d4f539fde9ce6b2113a001bb4d189e0aed70642d602b11"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/checkdmarc -v")

    assert_match "\"base_domain\": \"brew.sh\"", shell_output("#{bin}/checkdmarc brew.sh")
  end
end
