#!/bin/bash

# files to bundle into the release archive
RELEASE_FILES=(
  plugin/accurev.vim
  doc/accurev.txt
  syntax/accurev.vim
  autoload/vim/widgets/progressbar.vim
  INSTALL.vim4accurev
  README.vim4accurev
  CHANGES.vim4accurev
  LICENSE.vim4accurev
  )

[[ -z "$1" ]] && echo "Usage: $0 <version>" && exit 1
VERSION=$1

TARFILE="releases/vim4accurev-${VERSION}.tgz"
ZIPFILE="releases/vim4accurev-${VERSION}.zip"

echo "Vim Plugin - ${VERSION} Package Release"

[[ -f "${TARFILE}" || -f "${ZIPFILE}" ]] && echo "archives exist. exiting..." && exit 1

tar -czf ${TARFILE} ${RELEASE_FILES[@]}
echo "Created tarball: ${TARFILE}..."
zip -q ${ZIPFILE} ${RELEASE_FILES[@]}
echo "Created zipfile: ${TARFILE}..."

exit 0
