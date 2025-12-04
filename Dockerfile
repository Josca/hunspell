FROM debian:12-slim

# Install hunspell + dictionary, clean apt cache
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        locales \
        hunspell \
        hunspell-en-us \
        yq \
    && sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Default command (optional)
CMD ["hunspell", "-h"]
