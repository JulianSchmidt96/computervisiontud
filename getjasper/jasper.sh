#!/bin/bash

VERSION=2.0.25

unzip jasper-version-$VERSION.zip
cd jasper-version-$VERSION
mkdir compile

SOURCE_DIR=`pwd`
BUILD_DIR=compile
INSTALL_DIR=/usr
OPTIONS=

cmake -G "Unix Makefiles" -H$SOURCE_DIR -B$BUILD_DIR -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR $OPTIONS

cd compile
make clean all

cat >description-pak <<EOF
JasPer Image Processing/Coding Tool Kit
EOF

fakeroot checkinstall --fstrans --install=no --pkgname=libjasper --pkgversion=$VERSION --pkgrelease 1 --pkglicense="JasPer 2.0" \
         bash -c "make install" </dev/null

mv libjasper_$VERSION-1_amd64.deb ../..
cd ../..
rm -rf jasper-version-$VERSION

