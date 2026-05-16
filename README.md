# homebrew-morie

Homebrew tap for [morie](https://hadesllm.github.io/morie/) — Multi-domain
Open Research and Inferential Estimation.

## Install

```sh
brew tap hadesllm/morie
brew install morie
```

## Upgrade

```sh
brew update
brew upgrade morie
```

## What you get

- The `morie` CLI on your PATH.
- A self-contained Python 3.12 virtualenv at
  `$(brew --prefix)/opt/morie/libexec` with the full scientific stack
  (pandas, numpy, scipy, scikit-learn, statsmodels, DoubleML).
- Pure-Python install — no compilers required on your machine.

## Alternatives

| Channel | Command |
| --- | --- |
| One-liner (no pip/python needed) | `curl -fsSL https://hadesllm.github.io/morie/install.sh \| bash` |
| PyPI | `pip install morie` |
| r-universe (R) | `install.packages('morie', repos='https://hadesllm.r-universe.dev')` |
| Docker (GHCR) | `docker run --rm ghcr.io/hadesllm/morie:latest morie --help` |

## See also

- **Main repo**: [`hadesllm/morie`](https://github.com/hadesllm/morie) — Python + R source, JSS papers, install.sh
- **Docs site**: [hadesllm.github.io/morie](https://hadesllm.github.io/morie/) — Sphinx-rendered reference, quick start, methods
- **PyPI**: [pypi.org/project/morie](https://pypi.org/project/morie/) — the upstream source distribution this formula pulls from
- **r-universe**: [hadesllm.r-universe.dev/morie](https://hadesllm.r-universe.dev/morie) — R-package nightly binary builds

## Pre-alpha (v0.x)

morie is in pre-alpha. The first alpha milestone is v1.0.0; everything below is point releases of pre-alpha code. APIs and findings may shift between minor versions. See the [main repo's papers/](https://github.com/hadesllm/morie/tree/main/papers) for the empirical work behind each release.

## License

Tap definition: AGPL-3.0-or-later.
morie itself: AGPL-3.0-or-later (Python and R). The optional Linux-kernel
adjuncts in the main repo's `kernel-module/` and `daemon/` stay GPL-2.0-only
(kernel ABI requirement) and are not part of the Homebrew install. Papers,
data, and documentation are CC BY-NC-SA 4.0.
