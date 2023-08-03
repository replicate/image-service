FROM ghcr.io/containerd/nydus-snapshotter:v0.10.0

RUN apk add go delve make git
RUN git clone https://github.com/replicate/nydus-snapshotter.git && \
    cd nydus-snapshotter && \
    git checkout v0.10.0-gar-patch
RUN cd nydus-snapshotter && make debug
RUN cd nydus-snapshotter && install -D -m 755 bin/containerd-nydus-grpc /usr/local/bin/containerd-nydus-grpc

COPY ./target/release/nydusd /usr/local/bin/nydusd
