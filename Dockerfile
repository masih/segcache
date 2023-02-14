FROM rust:1.67-bullseye as BUILD

ARG PELIKAN_COMMIT_SHA="d76c2b30dc90026f1e68a07cc1d1328ba9646559"
RUN git clone --depth 1 https://github.com/pelikan-io/pelikan.git && \
    cd pelikan && \
    git fetch --depth 1 origin "${PELIKAN_COMMIT_SHA}"

RUN cd pelikan && cargo build --release

