#!/usr/bin/env sh

export DOCKERFILE_SHEBANG_SUPPRESS_BUILD_MESSAGE=true

./test.dockerfile -e HELLO=Hello,\ world! --
