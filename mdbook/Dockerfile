FROM rust:1 as builder
WORKDIR /app
RUN cargo install --git https://github.com/rust-lang/mdBook.git mdbook

FROM cgr.dev/chainguard/glibc-dynamic:latest-dev
COPY --from=builder /usr/local/cargo/bin/mdbook /usr/local/bin/mdbook
WORKDIR /src
