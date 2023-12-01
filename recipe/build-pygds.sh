#!/bin/bash

set -e

# update py-compile
cp ${BUILD_PREFIX}/share/automake-*/py-compile config/
# rebuild configure
autoreconf

mkdir -p _build_py${PY_VER}
cd _build_py${PY_VER}

export GDSIO_LIBS="-L${PREFIX}/lib -lframeio"

# configure
${SRC_DIR}/configure \
	--enable-python \
	--prefix=${PREFIX} \
;

# build
make -j ${CPU_COUNT} VERBOSE=1 V=1

# test
make -j ${CPU_COUNT} VERBOSE=1 V=1 check

# install
make -j ${CPU_COUNT} VERBOSE=1 V=1 install
