#!/usr/bin/env sh

# Build once to seed cache suppressing all output.
./test.dockerfile > /dev/null 2>&1

./test.dockerfile "Hello, world!"
