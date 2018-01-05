#!/usr/local/bin/fish

# SIMPLE PANDOC BUILD SCRIPT
#
# Put all MD files in src/ folder
# (Creating any subfolders you like for sorting)
# Ensure same folder exist in project root
# Run build.sh to convert MD source from src/ to HTML in project root
# the .htaccess in project root allows extension-free URLs (no .html)

for file in *.md */*.md
  echo "Converting "(echo "../$file" | sed '$s/\.md$/.html/')
  pandoc $file -f markdown -t html5 -H template/header-prod.html -B template/nav.html -A template/footer-prod.html -o (echo "../$file" | sed '$s/\.md$/.html/') -s
end