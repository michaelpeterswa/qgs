#!/bin/bash

echo "Welcome to the qgs installer!"

if ! command -v jq &> /dev/null
then
    echo "Please install jq"
    exit 1
fi

ARCH=$(uname -m)
DISTRO=$(uname -s)

if [ $DISTRO != "Darwin" ]; then
    echo "This script is only for Mac OS X"
    exit 1
fi

get_latest () {
    RESP=$(curl -s https://api.github.com/repos/michaelpeterswa/qgs/releases/latest)
    VERSION=$(echo $RESP | jq -r '.tag_name')

    LINK=$(echo $RESP | jq -r '.assets[] | select(.name | contains("'$1'")) | .browser_download_url')

    echo "Downloading $VERSION for $1"
    echo "Link: $LINK"

    sudo curl -fSL -o /usr/local/bin/qgs $LINK
    echo "Downloaded to /usr/local/bin/qgs"

    sudo chmod +x /usr/local/bin/qgs
    echo "Changed permissions to +x"
}

if [ $ARCH == "x86_64" ]; then
    get_latest x86_64-apple-darwin
    echo "Thanks for using qgs!"
    exit 0
fi

if [ $ARCH == "arm64" ]; then
    get_latest aarch64-apple-darwin
    echo "Thanks for using qgs!"
    exit 0
fi
