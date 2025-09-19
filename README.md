# electerm-builder-docker

Docker images for building electerm app

## Legacy Linux Builder

This repository contains a Dockerfile for building the legacy Linux version of electerm with the following specifications:

- **Base OS**: Ubuntu 18.04 LTS
- **Python**: 3.8
- **Node.js**: 16
- **GCC**: 8

### Usage

#### Build the Docker image:

```bash
docker build -f Dockerfile.legacy-linux -t electerm-builder-legacy .
```

#### Run a container:

```bash
# Run interactively
docker run -it --rm electerm-builder-legacy

# Run with mounted source code
docker run -it --rm -v /path/to/electerm:/workspace electerm-builder-legacy
```

#### Build electerm inside the container:

```bash
# Clone electerm repository (if not mounted)
git clone https://github.com/electerm/electerm.git /workspace

# Install dependencies and build
cd /workspace
npm install
npm run build
```

#### Validate the build environment:

```bash
# Run validation script to verify all tools are working
./validate-environment.sh
```

### Included Tools

- **GCC 8**: Set as default compiler
- **Python 3.8**: Set as default python/python3
- **Node.js 16**: Latest LTS version compatible with legacy environments
- **Build essentials**: Complete build toolchain
- **GUI libraries**: Libraries needed for Electron apps (GTK, NSS, etc.)
- **Non-root user**: `builder` user for secure building

### Environment Variables

- `DEBIAN_FRONTEND=noninteractive`: Prevents interactive prompts
- `NODE_VERSION=16`: Node.js version reference
- `PYTHON_VERSION=3.8`: Python version reference

