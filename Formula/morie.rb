class Morie < Formula
  include Language::Python::Virtualenv

  desc "Multi-domain scientific computing toolkit with the MRM framework"
  homepage "https://hadesllm.github.io/morie/"
  url "https://files.pythonhosted.org/packages/56/f7/26c68a507adab1c1f1653ed42c5affda1831154e639275729c21a2386980/morie-0.8.0.tar.gz"
  sha256 "a81a79c472ae0702e96cd41fadcdf8bae4585f5919233b38bedbfcd432fedbab"
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
