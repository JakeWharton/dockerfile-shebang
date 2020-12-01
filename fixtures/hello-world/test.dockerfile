#!/bin/dockerfile-shebang
# NOTE: This test is not actually executed using the shebang since it
# cannot use relative paths. It is only included for demonstrating
# normal usage.

FROM alpine:latest
ENTRYPOINT ["echo"]
