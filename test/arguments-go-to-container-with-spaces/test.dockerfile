#!/usr/bin/env dockerfile-shebang

FROM alpine:latest
RUN echo -e '#!/bin/ash\nfor arg in "$@"; do echo $arg; done' > /args \
 && chmod +x /args
ENTRYPOINT ["/args"]
