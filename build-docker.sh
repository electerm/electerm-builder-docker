#!/bin/bash

# Build script for electerm-builder Docker image

set -e

echo "Building electerm-builder Docker image..."

# Build the Docker image
docker build -t electerm-builder:local .

echo "✅ Docker image built successfully!"
echo ""
echo "Image: electerm-builder:local"
echo ""
echo "To test the image, run:"
echo "  docker run -it --rm electerm-builder:local"
echo ""
echo "To test building electerm in the container:"
echo "  docker run -it --rm -v \$(pwd)/../electerm:/workspace electerm-builder:local"
