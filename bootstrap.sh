#!/usr/local/bin/zsh

set -x
source env.sh

cd $BASE

# Root FS folder
mkdir -p $ROOTFS

# Initial build + deploy to "prime" everything
su -l $USER -c cd $BASE && ./build.sh

./deploy.sh

# Copy our bootstrap rootfs files over
cp -R ${ROOTBASE}/base/ ${ROOTFS}