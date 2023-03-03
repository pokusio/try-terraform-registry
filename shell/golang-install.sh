#!/bin/bash

export OPS_HOME=$(mktemp -d -t 'golang_install_XXXXXX')
export GO_DESIRED_VERSION="1.20.1"
export GO_DESIRED_OS="linux"
export GO_DESIRED_CPU_ARCH="amd64"

cd ${OPS_HOME}

pwd
curl -LO "https://go.dev/dl/go${GO_DESIRED_VERSION}.${GO_DESIRED_OS}-${GO_DESIRED_CPU_ARCH}.tar.gz"

ls -alh .
pwd

# ---
# deleting folder if exists, 
# deleting symbolic link if previous golang installation of previous version
# 
if [ -d /usr/local/go ]; then
  sudo rm -rf /usr/local/go
fi;

# ---
# deleting installation of same version : re-install
if [ -s /usr/local/golang-${GO_DESIRED_VERSION}/ ];then 
  sudo rm -fr /usr/local/golang-${GO_DESIRED_VERSION}
fi;

# sudo tar -C /usr/local -xzf go${GO_DESIRED_VERSION}.${GO_DESIRED_OS}-${GO_DESIRED_CPU_ARCH}.tar.gz
# sudo ls -alh /usr/local/go/bin

sudo mkdir -p /usr/local/golang-${GO_DESIRED_VERSION}/

sudo tar -C /usr/local/golang-${GO_DESIRED_VERSION}/ -xzf go${GO_DESIRED_VERSION}.${GO_DESIRED_OS}-${GO_DESIRED_CPU_ARCH}.tar.gz

ls -alh /usr/local/golang-${GO_DESIRED_VERSION}/go/bin
sudo ln -s /usr/local/golang-${GO_DESIRED_VERSION}/go /usr/local/go


echo 'export PATH="${PATH}:/usr/local/go/bin"' | tee -a ~/.profile \
 | tee -a ~/.bash_profile \
 | tee -a ~/.bashrc \
 | tee -a ~/.shrc 

source ~/.bashrc