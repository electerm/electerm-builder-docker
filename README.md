# Electerm Builder Docker

[![Docker Hub](https://img.shields.io/docker/v/zxdong262/electerm-builder-legacy?label=Docker%20Hub&sort=semver)](https://hub.docker.com/r/zxdong262/electerm-builder-legacy)

Docker image for building electerm legacy packages with Ubuntu 18.04, Python 3.8, Node.js 16, and GCC 8.

It is needed because some Linux distributions, like UOS 1070/Ubuntu 18, use old glibc(ver<2.34), native libs like node-pty build with major current Linux distributions, like Ubuntu 22/24 can not work in these Linux distributions

## test run

```bash
# Mount your electerm repository and build
docker run -it --rm \
  -v /path/to/electerm:/workspace \
  -w /workspace \
  zxdong262/electerm-builder-legacy \
  bash -c "npm ci && npm run b"
```

## Use in CI

Examples:

- [https://github.com/electerm/electerm/blob/master/.github/workflows/linux-legacy.yml](https://github.com/electerm/electerm/blob/master/.github/workflows/linux-legacy.yml)
- [https://github.com/electerm/electerm/blob/master/.github/workflows/linux-arm-legacy.yml](https://github.com/electerm/electerm/blob/master/.github/workflows/linux-arm-legacy.yml)

## Pre-installed Software

- **OS**: Ubuntu 18.04 x64/arm64
- **Node.js**: 16.x (latest)
- **Python**: 3.8 (with pip)
- **GCC**: 8.x
- **Ruby**: Full installation with FPM gem
- **Yarn**: Latest version
- **System Libraries**: All required for electerm building




