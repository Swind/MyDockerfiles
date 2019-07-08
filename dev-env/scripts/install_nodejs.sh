#!/bin/sh

VERSION="v10.16.0"
NODE_BASE_NAME="node-$VERSION-linux-x64"
NODE_FILE_NAME="$NODE_BASE_NAME.tar.xz" 

wget https://nodejs.org/dist/$VERSION/$NODE_FILE_NAME
tar -xvf $NODE_FILE_NAME 
ln -s $NODE_BASE_NAME nodejs 

rm -rf $NODE_FILE_NAME
