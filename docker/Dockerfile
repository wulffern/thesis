

FROM ubuntu:bionic

RUN apt-get update -q && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy texlive-full make git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
