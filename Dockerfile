FROM alpine:3.12.1

LABEL maintainer="Richard Kojedzinszky <richard@kojedz.in>"

# Install python3
RUN apk add --no-cache py3-pip py3-grpcio py3-protobuf && \
    ln -sf python3 /usr/bin/python && ln -sf pip3 /usr/bin/pip
