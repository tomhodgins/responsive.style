#!/usr/local/bin/fish

# SIMPLE SITEMAP BUILD SCRIPT

true > ../sitemap.txt

echo "Building sitemap…"

for file in ../*.html ../*/*.html
  echo " adding $file"
  echo (echo "https://responsive.style/$file" | sed '$s/\.\.\///') >> ../sitemap.txt
end

echo "Sitemap built"