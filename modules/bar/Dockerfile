FROM biocontainers/samtools:v1.9-4-deb_cv1

RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*
# distinct per module, so Wave keys a separate build for each one
LABEL io.seqera.wave-test.module="bar"
