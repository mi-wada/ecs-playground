# syntax=docker/dockerfile:1

FROM golang:1.25.3 AS builder

WORKDIR /src

RUN --mount=type=cache,target=/go/pkg/mod/,sharing=locked \
    # --mount=type=bind,source=go.sum,target=go.sum \
    --mount=type=bind,source=go.mod,target=go.mod \
    go mod download -x
RUN --mount=type=cache,target=/go/pkg/mod/ \
    --mount=type=bind,target=. \
    go build -o /bin/server

FROM debian:trixie-20251020-slim AS runner

RUN --mount=type=cache,target=/var/lib/apt,sharing=locked \
    --mount=type=cache,target=/var/cache/apt,sharing=locked \
    apt-get update && apt-get install -y curl

HEALTHCHECK --interval=30s --timeout=5s --retries=3 \
  CMD curl -f http://localhost/health || exit 1

COPY --from=builder /bin/server /bin/server

EXPOSE 80
CMD ["/bin/server"]
