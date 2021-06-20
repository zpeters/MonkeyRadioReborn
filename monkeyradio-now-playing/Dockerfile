FROM rustlang/rust:nightly-slim as builder
WORKDIR /usr/src/now-playing
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
RUN apt-get update && apt-get install -y mpc && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/monkeyradioreborn-now-playing /usr/local/bin/now-playing
CMD ["now-playing"]
