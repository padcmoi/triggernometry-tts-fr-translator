#!/bin/bash

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
