#!/bin/bash

set -e

mkdir -p _build_py${PY_VER}
cd _build_py${PY_VER}

export GDSIO_LIBS="-L${PREFIX}/lib -lframeio"

# ignore deprecation warning from distutils, it breaks ac_python_devel.m4
export PYTHONWARNINGS="${PYTHONWARNINGS},ignore:The distutils package:DeprecationWarning"

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
