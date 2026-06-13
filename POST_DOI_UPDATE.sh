#!/bin/bash
# POST_DOI_UPDATE.sh
# Run after Zenodo publishes and assigns DOI.
# Updates CITATION.cff, README.md, then creates tag v1.0.1.
#
# Usage:
#   bash POST_DOI_UPDATE.sh 10.5281/zenodo.XXXXXXX
#
# Example:
#   bash POST_DOI_UPDATE.sh 10.5281/zenodo.1234567

set -e

if [ -z "$1" ]; then
  echo "ERROR: provide DOI as argument."
  echo "  Usage: bash POST_DOI_UPDATE.sh 10.5281/zenodo.XXXXXXX"
  exit 1
fi

DOI="$1"
DATE=$(date +%Y-%m-%d)

echo "==> Updating CITATION.cff with DOI: $DOI"
sed -i "s|doi: \"10.5281/zenodo.XXXXXXX\"|doi: \"$DOI\"|g" CITATION.cff

echo "==> Updating README.md with DOI"
sed -i "s|DOI: \[Zenodo, to be assigned upon acceptance\]|DOI: $DOI|g" README.md

echo "==> Updating GITHUB_RELEASE_NOTES.md"
sed -i "s|\[to be assigned\]|$DOI|g" GITHUB_RELEASE_NOTES.md

echo "==> Updating CHANGELOG.md — adding v1.0.1 metadata entry"
cat >> CHANGELOG.md << ENTRY

## [1.0.1] — $DATE

### Changed

- Updated CITATION.cff, README.md: added Zenodo DOI $DOI
- No changes to ontology or knowledge graph files
ENTRY

echo "==> Committing metadata update"
git add CITATION.cff README.md CHANGELOG.md GITHUB_RELEASE_NOTES.md
git commit -m "chore: add Zenodo DOI $DOI (metadata only — no ontology/KG changes)"
git tag -a v1.0.1 -m "v1.0.1: metadata update — Zenodo DOI $DOI"
git push origin main --tags

echo ""
echo "Done. Tag v1.0.1 pushed."
echo "Remember to update paper footnote with: $DOI"
