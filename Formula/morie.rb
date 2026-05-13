class Morie < Formula
  include Language::Python::Virtualenv

  desc "Multi-domain scientific computing toolkit with the MRM framework"
  homepage "https://hadesllm.github.io/morie/"
  url "https://files.pythonhosted.org/packages/2f/1b/18137d4ee7356eef5bb2b57be6ab337b3e23efa72956f3f657db97bdfac6/morie-0.4.12.tar.gz"
  sha256 "3cc66de039eef01b22510fad9f3e3464fd2ca8bdf793415f2798d9dfd2157c26"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "python@3.12"

  # Heavy runtime dependencies are resolved by pip at install time inside
  # the venv. This is the documented pattern for Python applications that
  # depend on the SciPy stack — fully pinning resources here would mean
  # tracking ~30+ wheels through every numpy/pandas point release.
  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install_and_link buildpath
  end

  test do
    system bin/"morie", "--version"
    output = shell_output("#{libexec}/bin/python -c 'import morie; print(morie.__version__)'")
    assert_match version.to_s, output
  end
end
