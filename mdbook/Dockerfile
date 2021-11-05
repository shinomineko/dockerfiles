FROM rust:1-slim-bullseye
ARG MDBOOK_VERSION="0.4.13"
LABEL maintainer "sc@shinomin.me"

RUN cargo install mdbook --vers ${MDBOOK_VERSION}

WORKDIR /src
