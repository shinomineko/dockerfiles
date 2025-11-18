FROM rust:1 AS builder
WORKDIR /app
RUN cargo install mdbook@0.4.52 mdbook-mermaid@0.16.2

FROM cgr.dev/chainguard/glibc-dynamic:latest-dev
COPY --from=builder /usr/local/cargo/bin/mdbook /usr/local/bin/mdbook
COPY --from=builder /usr/local/cargo/bin/mdbook-mermaid /usr/local/bin/mdbook-mermaid
WORKDIR /src
ENTRYPOINT [ "/usr/local/bin/mdbook" ]
CMD [ "--help" ]
