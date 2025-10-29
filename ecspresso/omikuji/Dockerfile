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

COPY --from=builder /bin/server /bin/server

EXPOSE 8080
CMD ["/bin/server"]
