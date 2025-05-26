FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y bash curl gawk sudo && \
    apt-get install -y translate-shell && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the script into the image root
COPY script/translate.sh /app/translate.sh

# Conversion automatique des fins de ligne Windows en LF pour le script (fix universel)
RUN sed -i 's/\r$//' /app/translate.sh

CMD ["bash", "/app/translate.sh"]
