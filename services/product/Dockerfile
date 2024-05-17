FROM rust:1.78 AS builder

RUN apt-get -y update
RUN apt-get install musl-tools -y
WORKDIR /app/src/
RUN rustup target add x86_64-unknown-linux-musl

RUN USER=root cargo new product
WORKDIR /app/src/product
COPY Cargo.toml Cargo.lock ./
RUN cargo build --release

COPY src ./src
RUN cargo install --target x86_64-unknown-linux-musl --path .

FROM scratch
COPY --from=builder /usr/local/cargo/bin/product /usr/local/bin/product

EXPOSE 8080
CMD [ "product", "-a", "0.0.0.0", "-p", "8080"]