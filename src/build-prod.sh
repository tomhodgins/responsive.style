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
  echo " converting $file"
  pandoc $file -f markdown -t html5 -H templates/header-prod.html -B templates/nav.html -A templates/footer-prod.html -o (echo "../$file" | sed '$s/\.md$/.html/') -s  --data-dir=./ --highlight-style breezedark
end

echo "HTML built"

# SIMPLE SITEMAP BUILD SCRIPT

true > ../sitemap.txt

echo "Building sitemap…"

for file in ../*.html ../*/*.html
  echo " adding $file"
  echo (echo "https://responsive.style/$file" | sed '$s/\.\.\///') >> ../sitemap.txt
end

echo "Sitemap built"

echo "Build complete!"