#!/usr/bin/env dockerfile-shebang

FROM alpine:latest
RUN echo 'Hello, file!' > /file.txt
ENTRYPOINT ["echo"]
