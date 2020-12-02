#!/usr/bin/env dockerfile-shebang

FROM alpine:latest
RUN echo -e '#!/bin/ash\necho $HELLO' > /args \
 && chmod +x /args
ENTRYPOINT ["/args"]
