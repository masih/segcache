FROM rust:1.67-bullseye as BUILD

RUN apt update && apt install -y cmake clang protobuf-compiler

WORKDIR /tmp/pelikan
ARG PELIKAN_COMMIT_ID="d76c2b30dc90026f1e68a07cc1d1328ba9646559"
RUN git clone --depth 1 https://github.com/pelikan-io/pelikan.git . && \
    git fetch --depth 1 origin "${PELIKAN_COMMIT_ID}"
RUN cargo fetch
RUN cargo build --release --package=segcache

FROM gcr.io/distroless/cc
COPY --from=BUILD /tmp/pelikan/target/release/pelikan_segcache_rs /usr/bin/pelikan_segcache_rs

ENTRYPOINT ["/usr/bin/pelikan_segcache_rs"]