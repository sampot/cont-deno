FROM ubuntu:18.04 as builder

RUN DEBIAN_FRONTEND=noninteractive apt-get update -q && \
  apt-get install unzip

ADD https://github.com/denoland/deno/releases/download/v1.0.5/deno-x86_64-unknown-linux-gnu.zip /tmp

WORKDIR /tmp
RUN unzip /tmp/deno-x86_64-unknown-linux-gnu.zip
RUN ls -al /tmp
RUN ldd /tmp/deno

FROM sampot/basebox:18.04-spk1

COPY --from=builder /tmp/deno /usr/bin

VOLUME /usr/src
WORKDIR /usr/src

ENTRYPOINT ["/usr/bin/deno"]
