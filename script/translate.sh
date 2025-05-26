#!/bin/bash

# Automatic detection and installation of translate-shell if missing
if ! command -v trans >/dev/null 2>&1; then
    echo "translate-shell (trans) is not installed. Attempting to install..."
    if [ -f /etc/debian_version ]; then
        sudo apt update && sudo apt install -y translate-shell
    elif [ -f /etc/redhat-release ]; then
        sudo dnf install -y translate-shell || sudo yum install -y translate-shell
    elif [ -f /etc/arch-release ]; then
        sudo pacman -Sy --noconfirm translate-shell
    else
        echo "Unrecognized distribution. Please install translate-shell manually."
        exit 1
    fi
fi

mkdir -p fr

for file in en/*.xml; do
    out="fr/$(basename "$file" .xml)-fr.xml"
    echo "Translating $file to $out ..."
    awk '{
    if (match($0, /UseTTSTextExpression="([^"]*)"/, arr)) {
      cmd = "trans -b en:fr \"" arr[1] "\""
      cmd | getline trad
      close(cmd)
      gsub(/UseTTSTextExpression="[^"]*"/, "UseTTSTextExpression=\"" trad "\"")
    }
    print
  }' "$file" >"$out"
done

chmod -R 777 fr

echo "All XML files in en/ have been translated to fr/."
