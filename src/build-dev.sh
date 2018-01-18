#!/usr/local/bin/fish

# SIMPLE PANDOC BUILD SCRIPT
#
# Put all MD files in src/ folder
# (Creating any subfolders you like for sorting)
# Ensure same folder exist in project root
# Run build.sh to convert MD source from src/ to HTML in project root
# the .htaccess in project root allows extension-free URLs (no .html)

echo "Converting to HTML…"

for file in *.md */*.md
  echo "Converting $file"
  pandoc $file -f markdown -t html5 -H templates/header-dev.html -B templates/nav.html -A templates/footer-dev.html -o (echo "../$file" | sed '$s/\.md$/.html/') -s --data-dir=./ --highlight-style breezedark
end

echo "HTML built"

echo "Build complete!"
