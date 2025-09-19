# Electerm Builder Docker

Docker image for building electerm legacy packages with Ubuntu 18.04, Python 3.8, Node.js 16, and GCC 8.

### Build Electerm

```bash
# Mount your electerm repository and build
docker run -it --rm \
  -v /path/to/electerm:/workspace \
  -w /workspace \
  zxdong262/electerm-builder-legacy \
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

## Development

The Docker image includes a non-root `builder` user for security. All tools are accessible and properly configured.

dockers for build electerm app
