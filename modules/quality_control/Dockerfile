FROM alpine

RUN apk update && apk add bash coreutils procps
# distinct per module, so Wave keys a separate build for each one
LABEL io.seqera.wave-test.module="quality_control"
