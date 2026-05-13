class Morie < Formula
  include Language::Python::Virtualenv

  desc "Multi-domain scientific computing toolkit with the MRM framework"
  homepage "https://hadesllm.github.io/morie/"
  url "https://files.pythonhosted.org/packages/f3/0c/c49187fa5f3dafec53671fc9807ee70df9c50c0452eea5ab87a77ce7b8f1/morie-0.5.0.tar.gz"
  sha256 "0c2392cb06584aa37748334694340a25ec61b867d0f2e4b879c144caa8e142c9"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "python@3.12"

  # Heavy runtime dependencies are resolved by pip at install time inside
  # the venv. This is the documented pattern for Python applications that
  # depend on the SciPy stack — fully pinning resources here would mean
  # tracking ~30+ wheels through every numpy/pandas point release.
  #
  # We invoke pip directly rather than `pip_install_and_link buildpath`
  # because the latter installs morie without resolving its declared
  # dependencies (the Homebrew helper expects explicit `resource` blocks
  # for every transitive dep, which the SciPy stack makes impractical).
  # `pip install morie==<version>` pulls the sdist from PyPI and lets
  # pip resolve numpy / pandas / scipy / scikit-learn / statsmodels /
  # DoubleML / matplotlib / httpx / etc. into the brew-managed venv.
  def install
    venv = virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", "--upgrade", "morie==#{version}"
    bin.install_symlink libexec/"bin/morie"
    bin.install_symlink libexec/"bin/moirais"
  end

  test do
    system bin/"morie", "--version"
    output = shell_output("#{libexec}/bin/python -c 'import morie; print(morie.__version__)'")
    assert_match version.to_s, output
  end
end
