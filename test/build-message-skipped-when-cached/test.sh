#!/usr/bin/env sh

# Build once to seed cache suppressing all output.
./build-message-skipped.dockerfile > /dev/null 2>&1

./build-message-skipped.dockerfile "Hello, world!"
