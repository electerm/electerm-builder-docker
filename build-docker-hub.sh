#!/bin/bash

# Build script for electerm-builder-legacy Docker image
# Publishes to Docker Hub with multi-architecture support

set -e

# Configuration
DOCKER_IMAGE="zxdong262/electerm-builder-legacy"
VERSION="1.0.1"  # Ubuntu 18.04 + Python 3.8 + Node.js 16 + GCC 8

echo "🚀 Building and publishing electerm-builder-legacy Docker image..."
echo "   Image: $DOCKER_IMAGE"
echo "   Version: $VERSION"
echo "   Architectures: linux/amd64,linux/arm64"

# Set up Docker Buildx
echo "📦 Setting up Docker Buildx..."
docker buildx create --use --name electerm-builder-multi-arch || true

# Build for multiple architectures and push to Docker Hub
echo "🔨 Building and pushing Docker image..."
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  -t $DOCKER_IMAGE:latest \
  -t $DOCKER_IMAGE:$VERSION \
  -t $DOCKER_IMAGE:ubuntu18.04 \
  -t $DOCKER_IMAGE:node16 \
  -t $DOCKER_IMAGE:python3.8 \
  -t $DOCKER_IMAGE:gcc8 \
  --push \
  . 2>&1 | tee build.log

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "✅ Build and push successful!"
  echo ""
  echo "🏷️  Published tags:"
  echo "   - $DOCKER_IMAGE:latest"
  echo "   - $DOCKER_IMAGE:$VERSION"
  echo "   - $DOCKER_IMAGE:ubuntu18.04"
  echo "   - $DOCKER_IMAGE:node16"
  echo "   - $DOCKER_IMAGE:python3.8"
  echo "   - $DOCKER_IMAGE:gcc8"
  echo ""
  echo "📋 Usage examples:"
  echo "   docker run -it --rm $DOCKER_IMAGE:latest"
  echo "   docker run -it --rm -v \$(pwd):/workspace $DOCKER_IMAGE:latest"
else
  echo "❌ Build failed. Check build.log for details."
  exit 1
fi

# Clean up the builder
echo "🧹 Cleaning up Docker Buildx..."
docker buildx rm electerm-builder-multi-arch || true

echo "🎉 Done!"
