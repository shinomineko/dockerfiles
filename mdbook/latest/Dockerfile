FROM rust:1 AS builder
WORKDIR /app
RUN cargo install --git https://github.com/rust-lang/mdBook.git mdbook \
	&& cargo install mdbook-mermaid

FROM gcr.io/distroless/cc-debian12
COPY --from=builder /usr/local/cargo/bin/mdbook /usr/local/bin/mdbook
COPY --from=builder /usr/local/cargo/bin/mdbook-mermaid /usr/local/bin/mdbook-mermaid
WORKDIR /src
ENTRYPOINT [ "/usr/local/bin/mdbook" ]
CMD [ "--help" ]
