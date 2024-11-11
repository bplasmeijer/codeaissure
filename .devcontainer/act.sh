#!/bin/bash 
set -e
source <(curl -sSL benco.io/lib) # Load libary from remote URL, it's safe!

GITHUB="nektos/act"
VERSION=${1:-"$(get_latest_release $GITHUB)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=act
NAME="Nektos Act"

echo "$VERSION"

pre_run

curl -SL https://github.com/$GITHUB/releases/download/v"${VERSION}"/act_Linux_x86_64.tar.gz | \
     tar -zx -C "$INSTALL_DIR" $CMD

post_run