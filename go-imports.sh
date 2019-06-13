#!/bin/sh

STAGED_GO_FILES=$(git diff --cached --name-only | grep ".go$")

if [[ "$STAGED_GO_FILES" = "" ]]; then
  exit 0
fi

for FILE in $STAGED_GO_FILES
do
  goimports -w $FILE
done

