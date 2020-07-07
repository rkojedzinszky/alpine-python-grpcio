FROM alpine:3.12.0

LABEL maintainer="Richard Kojedzinszky <richard@kojedz.in>"

# Install python3
RUN apk add --no-cache py3-pip && \
    ln -sf python3 /usr/bin/python && ln -sf pip3 /usr/bin/pip

# Install grpcio and protobuf from source
RUN apk --no-cache add libstdc++ && \
    apk add --no-cache -t .build-deps python3-dev gcc g++ make libffi-dev && \
    pip install --no-binary grpcio,protobuf grpcio protobuf && \
    find /usr/lib -name '*.so' -print0 | xargs -r0 strip -s ; \
    apk del .build-deps && \
    rm -rf /root/.cache
