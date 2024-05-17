FROM rust:1.78 AS builder

RUN apt-get -y update
RUN apt-get install musl-tools -y
WORKDIR /app/src/
RUN rustup target add x86_64-unknown-linux-musl

RUN USER=root cargo new customer
WORKDIR /app/src/customer
COPY Cargo.toml Cargo.lock ./
RUN cargo build --release

COPY src ./src
RUN cargo install --target x86_64-unknown-linux-musl --path .

FROM scratch
COPY --from=builder /usr/local/cargo/bin/customer /usr/local/bin/customer

EXPOSE 8080
CMD [ "customer", "-a", "0.0.0.0", "-p", "8080"]