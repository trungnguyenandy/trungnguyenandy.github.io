#!/bin/bash

# Generate index.html for debs directory
cd debs

cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Packages - TrungNguyen Andy Repo</title>
    <meta charset="utf-8">
    <style>
        body { font-family: Arial; background: #000; color: #fff; padding: 20px; }
        a { color: #0084ff; text-decoration: none; }
        .deb { margin: 10px 0; padding: 10px; background: #1a1a1a; border-radius: 5px; }
    </style>
</head>
<body>
    <h1>Debian Packages</h1>
    <div class="packages">
EOF

# List all .deb files
for deb in *.deb; do
    if [ -f "$deb" ]; then
        size=$(ls -lh "$deb" | awk '{print $5}')
        echo "<div class='deb'><a href='$deb'>$deb</a> ($size)</div>" >> index.html
    fi
done

cat >> index.html << 'EOF'
    </div>
    <p><a href="../">← Back to main repo</a></p>
</body>
</html>
EOF

cd ..
echo "✅ Generated debs/index.html"
