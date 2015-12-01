#!/usr/bin/env sh
# Generate ctags. Copyright (c) 2015, c9n

set -o errexit
set -o nounset
set -o pipefail
#set -o xtrace

pushd $(dirname "${0}") > /dev/null
basedir=$(pwd -L)
popd > /dev/null

cd $(dirname "${basedir}")
echo "Current dir: $(pwd)"

echo "Generating ctags..."
echo "Ctags file: .ctags"

rm -rf .ctags
find src -name \*.h -o -name \*.c | grep -v test | grep -v example > src.files
ctags -R -f .ctags -L src.files
rm -rf src.files

echo "Done."

