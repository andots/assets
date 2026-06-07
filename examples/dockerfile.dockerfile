# darkmodern.nvim — colorscheme showcase
# AI-generated code for colorscheme highlighting demonstration only.
# No functional guarantees. Not intended for production use.

# --- Build Stage ---

ARG  GO_VERSION=1.22
ARG  ALPINE_VERSION=3.19
ARG  APP_PORT=8080

FROM golang:${GO_VERSION}-alpine AS builder

LABEL maintainer="darkmodern <dev@example.com>"
LABEL org.opencontainers.image.source="https://github.com/example/showcase"

WORKDIR /build

# Install build dependencies
RUN apk add --no-cache \
        git \
        ca-certificates \
        tzdata && \
    adduser \
        --disabled-password \
        --gecos "" \
        --home "/nonexistent" \
        --shell "/sbin/nologin" \
        --no-create-home \
        --uid 65532 \
        appuser

COPY go.mod go.sum ./
RUN  go mod download && go mod verify

COPY . .
RUN  CGO_ENABLED=0 \
     GOOS=linux \
     GOARCH=amd64 \
     go build \
        -ldflags="-w -s -X main.version=${GO_VERSION}" \
        -o /build/app \
        ./cmd/server

# --- Runtime Stage ---

FROM alpine:${ALPINE_VERSION} AS runtime

ENV  APP_ENV=production \
     APP_PORT=${APP_PORT} \
     TZ=Asia/Tokyo

WORKDIR /app

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /usr/share/zoneinfo                /usr/share/zoneinfo
COPY --from=builder /etc/passwd                        /etc/passwd
COPY --from=builder /build/app                         ./app

EXPOSE ${APP_PORT}

HEALTHCHECK --interval=30s \
            --timeout=5s \
            --start-period=10s \
            --retries=3 \
    CMD wget -qO- http://localhost:${APP_PORT}/health || exit 1

USER appuser

ENTRYPOINT ["/app/app"]
CMD        ["--env", "production", "--port", "8080"]
