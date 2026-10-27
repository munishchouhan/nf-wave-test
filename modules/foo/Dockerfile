FROM alpine 

RUN apk update && apk add bash procps cowsay \
        --update-cache \
        --repository https://dl-cdn.alpinelinux.org/alpine/edge/community \
        --repository https://dl-cdn.alpinelinux.org/alpine/edge/main \
        --repository https://dl-cdn.alpinelinux.org/alpine/edge/testing

RUN echo hello 

# distinct per module, so Wave keys a separate build for each one
LABEL io.seqera.wave-test.module="foo"
