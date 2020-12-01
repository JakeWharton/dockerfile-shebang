#!/usr/bin/env dockerfile-shebang

FROM alpine:latest
RUN sleep 2
ENTRYPOINT ["echo"]
