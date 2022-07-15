#!/usr/bin/env sh

curl -sSL https://raw.githubusercontent.com/voidint/g/master/install.sh | bash

export GOROOT="${HOME}/.g/go"
export PATH="${HOME}/.g/go/bin:$PATH"
export G_MIRROR=https://golang.google.cn/dl/

g ls-remote stable

# g install