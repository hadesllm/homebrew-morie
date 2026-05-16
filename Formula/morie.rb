class Morie < Formula
  include Language::Python::Virtualenv

  desc "Multi-domain scientific computing toolkit with the MRM framework"
  homepage "https://hadesllm.github.io/morie/"
  url "https://files.pythonhosted.org/packages/24/87/4801b6bd0a8b6d2ef7f05e32ef1b13790556ba3107bec2d55f30a9ceadbb/morie-0.7.3.tar.gz"
  sha256 "00d7e5d43a4f8aaa288dd4efd836562ea38b1c0d792d608cf4c0783f227367ff"
  license "AGPL-3.0-or-later"

  depends_on "python@3.12"

  # Heavy runtime dependencies are resolved by pip at install time inside
  # the venv. This is the documented pattern for Python applications that
  # depend on the SciPy stack — fully pinning resources here would mean
  # tracking ~30+ wheels through every numpy/pandas point release.
  #
  # We invoke `python -m pip` (not `pip` directly) because Homebrew's
  # virtualenv_create writes a pip launcher whose shebang can point at a
  # path that doesn't yet exist when pip runs from the formula sandbox,
  # silently failing the install.  `python -m pip` uses the venv's
  # python directly and resolves morie's declared dependencies
  # (numpy / pandas / scipy / scikit-learn / statsmodels / DoubleML /
  # matplotlib / httpx / ...) from PyPI.
  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/python", "-m", "pip", "install", "--upgrade", "pip"
    system libexec/"bin/python", "-m", "pip", "install", "morie==#{version}"
    bin.install_symlink libexec/"bin/morie"
  end

  test do
    system bin/"morie", "--version"
    output = shell_output("#{libexec}/bin/python -c 'import morie; print(morie.__version__)'")
    assert_match version.to_s, output
  end
end
