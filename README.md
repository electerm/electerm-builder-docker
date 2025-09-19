# Electerm Builder Docker

Docker image for building electerm legacy packages with Ubuntu 18.04, Python 3.8, Node.js 16, and GCC 8.

## Quick Start

### 1. Build the Docker Image

```bash
./build-docker.sh
```

### 2. Test the Docker Image

```bash
./test-docker.sh
```

This will test building electerm using the Docker image (requires electerm repository at `../electerm`).

## Manual Usage

### Build the Docker Image

```bash
docker build -t electerm-builder:local .
```

### Test the Environment

```bash
docker run -it --rm electerm-builder:local
```

### Build Electerm

```bash
# Mount your electerm repository and build
docker run -it --rm \
  -v /path/to/electerm:/workspace \
  -w /workspace \
  electerm-builder:local \
  bash -c "npm ci && npm run b"
```

## Pre-installed Software

- **OS**: Ubuntu 18.04
- **Node.js**: 16.x (latest)
- **Python**: 3.8 (with pip)
- **GCC**: 8.x
- **Ruby**: Full installation with FPM gem
- **Yarn**: Latest version
- **System Libraries**: All required for electerm building

## CI/CD Integration

Use the provided workflow file `workflows/linux-legacy-docker.yml` as a template for GitHub Actions that uses this Docker image.

## Development

The Docker image includes a non-root `builder` user for security. All tools are accessible and properly configured.

dockers for build electerm app
