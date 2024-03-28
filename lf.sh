#!/bin/bash

git ls-files -m | while read file; do
  if file "$file" | grep -q "text"; then
    if awk '/\r$/' "$file" > /dev/null; then
      echo "Convert to LF : $file"
      dos2unix "$file"
    fi
  fi
done
