

FROM ubuntu:bionic

#- Texlive
RUN apt-get -qq dist-upgrade  &&apt-get update -q  && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy texlive-full make git curl epstool && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#RUN apt-get update -q && \
#    DEBIAN_FRONTEND=noninteractive apt-get install -qy texlive-full make git && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/*
