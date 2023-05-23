#!/bin/bash
set -e

source "buildScript/init/env.sh"
ENV_NB4A=1
source "buildScript/lib/core/get_source_env.sh"
pushd ..

######
## From nekoray/libs/get_source.sh
######

####
if [ ! -d "sing-box-extra" ]; then
  git clone --no-checkout https://github.com/MatsuriDayo/sing-box-extra.git
fi
pushd sing-box-extra
git checkout "$COMMIT_SING_BOX_EXTRA"

ENV_SING_BOX_EXTRA=1
source $SRC_ROOT/buildScript/lib/core/get_source_env.sh
NO_ENV=1 ./libs/get_source.sh
popd

####
if [ ! -d "sing-mux" ]; then
  git clone --no-checkout https://github.com/maskedeken/sing-mux.git
fi
pushd sing-mux
git checkout "$COMMIT_SING_MUX"
popd

####
if [ ! -d "sing-shadowtls" ]; then
  git clone --no-checkout https://github.com/maskedeken/sing-shadowtls.git
fi
pushd sing-shadowtls
git checkout "$COMMIT_SING_SHADOWTLS"
popd

popd
