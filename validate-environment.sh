#!/bin/bash
# Validation script to verify the build environment

echo "=== Legacy Linux Build Environment Validation ==="
echo

echo "Checking OS version:"
cat /etc/os-release | grep -E "(NAME|VERSION)"
echo

echo "Checking GCC version:"
gcc --version | head -1
echo

echo "Checking G++ version:"
g++ --version | head -1
echo

echo "Checking Python version:"
python --version
echo

echo "Checking Python3 version:"
python3 --version
echo

echo "Checking Node.js version:"
node --version
echo

echo "Checking npm version:"
npm --version
echo

echo "Checking pip version:"
pip --version || pip3 --version
echo

echo "Checking build environment:"
echo "- Current user: $(whoami)"
echo "- Working directory: $(pwd)"
echo "- Available cores: $(nproc)"
echo "- Memory: $(free -h | grep Mem | awk '{print $2}')"
echo

echo "Verifying compiler functionality:"
echo 'int main() { return 0; }' > /tmp/test.c
gcc -o /tmp/test /tmp/test.c && echo "✓ GCC compilation works" || echo "✗ GCC compilation failed"
rm -f /tmp/test /tmp/test.c
echo

echo "Verifying Python functionality:"
python -c "print('✓ Python works')" || echo "✗ Python failed"
echo

echo "Verifying Node.js functionality:"
node -e "console.log('✓ Node.js works')" || echo "✗ Node.js failed"
echo

echo "=== Validation Complete ==="