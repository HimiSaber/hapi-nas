FROM debian:bookworm-slim

ARG HAPI_VERSION=v0.16.4
ARG TARGETARCH

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl tar \
    && rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    case "${TARGETARCH}" in \
      amd64) asset='hapi-linux-x64-baseline.tar.gz' ;; \
      arm64) asset='hapi-linux-arm64.tar.gz' ;; \
      *) echo "Unsupported TARGETARCH=${TARGETARCH}" >&2; exit 1 ;; \
    esac; \
    curl -fsSL -o /tmp/hapi.tgz "https://github.com/tiann/hapi/releases/download/${HAPI_VERSION}/${asset}"; \
    tar -xzf /tmp/hapi.tgz -C /usr/local/bin; \
    chmod +x /usr/local/bin/hapi; \
    rm -f /tmp/hapi.tgz

ENV HAPI_HOME=/data \
    HAPI_LISTEN_HOST=0.0.0.0 \
    HAPI_LISTEN_PORT=3006

WORKDIR /data
VOLUME ["/data"]
EXPOSE 3006

CMD ["hapi", "hub"]
