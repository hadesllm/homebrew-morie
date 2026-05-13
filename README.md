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
| PyPI | `pip install morie` |
| r-universe (R) | `install.packages('morie', repos='https://hadesllm.r-universe.dev')` |
| Docker (GHCR) | `docker run --rm ghcr.io/hadesllm/morie:latest morie --help` |
| One-liner | `curl -fsSL https://raw.githubusercontent.com/hadesllm/morie/main/install.sh \| bash` |

## License

Tap definition: MIT.
morie itself: MIT OR Apache-2.0 (Python), GPL-2 (R package).
