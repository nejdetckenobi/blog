#!/usr/bin/env bash

echo "# Index" > docs/index.md
echo "" >> docs/index.md
cat frontmatter.md >> docs/index.md
echo "" >> docs/index.md

find docs -name '*.md' -and ! -name 'index.md' -and ! -name 'frontmatter.md' | cut -d . -f 1 | cut -d / -f 2 | xargs -I% echo "- [%](%.html)" >> docs/index.md
