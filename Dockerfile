# Stage 1: Build the application
FROM rust:1.75-slim-bookworm AS builder

# Install system dependencies for webview and GTK
RUN apt-get update && apt-get install -y \
    libgtk-3-dev \
    libwebkit2gtk-4.0-dev \
    build-essential \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Copy the source code
COPY . .

# Build the application in release mode
RUN cargo build --release

# Stage 2: Create a minimal image to hold the binary
FROM debian:bookworm-slim

# Install runtime dependencies
RUN apt-get update && apt-get install -y \
    libgtk-3-0 \
    libwebkit2gtk-4.0-37 \
    && rm -rf /var/lib/apt/lists/*

# Copy the binary from the builder stage
COPY --from=builder /usr/src/app/target/release/fourmessenger-app /usr/local/bin/fourmessenger-app

# Set the entrypoint
ENTRYPOINT ["fourmessenger-app"]
