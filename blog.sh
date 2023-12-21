#!/usr/bin/env bash

if [ "$1" = "new" ]
then
    touch "draft/$(date +'%Y-%m-%d-%H-%M-%S').md"
    echo "A new post is created as draft."
elif [ "$1" = "publish" ]
then
    ls draft | percol --prompt "POST TO PUBLISH>" | xargs -I% mv draft/% docs/

elif [ "$1" = "unpublish" ]
then
    ls draft | percol --prompt "POST TO UNPUBLISH>" | xargs -I% mv docs/% draft/
elif [ "$1" = "reindex" ]
then
    cat frontmatter.md >> docs/index.md
    echo "" >> docs/index.md
    
    find docs -name '*.md' -and ! -name 'index.md' -and ! -name 'frontmatter.md' | cut -d . -f 1 | cut -d / -f 2 | xargs -I% echo "- [%](%.html)" > docs/index.md
else
    echo "Invalid command."
fi
