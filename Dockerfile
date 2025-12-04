FROM debian:12-slim

# Install hunspell + dictionary, clean apt cache
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        locales \
        hunspell \
        hunspell-en-us \
        yq \
    && rm -rf /var/lib/apt/lists/*

# Default command (optional)
CMD ["hunspell", "-h"]
