#!/bin/bash

echo "🔄 Updating TrungNguyen Andy Repo..."

# Generate Packages
dpkg-scanpackages debs /dev/null > Packages
gzip -9fk Packages
bzip2 -9fk Packages

# Git operations
git add .
git commit -m "Update repo - $(date +%Y-%m-%d_%H:%M:%S)"
git push origin main

echo "✅ Repo updated successfully!"
echo "📦 Packages available at: https://trungnguyenandy.github.io/"

