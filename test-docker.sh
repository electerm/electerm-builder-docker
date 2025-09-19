#!/bin/bash

# Test script to verify the Docker image can build electerm

set -e

ELECTERM_PATH="../electerm"

echo "Testing electerm-builder Docker image..."

# Check if electerm directory exists
if [ ! -d "$ELECTERM_PATH" ]; then
    echo "❌ Error: electerm directory not found at $ELECTERM_PATH"
    echo "Please ensure the electerm repository is cloned at the expected location."
    exit 1
fi

echo "✅ Found electerm repository at $ELECTERM_PATH"

# Test the Docker image
echo "🔍 Testing Docker image with electerm build..."

docker run -it --rm \
    -v "$(realpath $ELECTERM_PATH):/workspace" \
    -w /workspace \
    electerm-builder:local \
    bash -c "
        echo '=== Environment Check ==='
        node --version
        npm --version
        python3 --version
        gcc --version
        echo ''
        echo '=== Installing Dependencies ==='
        npm ci
        echo ''
        echo '=== Running Build ==='
        npm run b
        echo ''
        echo '✅ Build completed successfully!'
    "

echo "🎉 Docker image test completed!"
