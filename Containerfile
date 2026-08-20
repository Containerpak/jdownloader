FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/jdownloader"

COPY jdownloader /usr/bin/jdownloader
COPY jdownloader.desktop /usr/share/applications/jdownloader.desktop
COPY icon.png /usr/share/icons/hicolor/128x128/apps/jdownloader.png

RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-21-jre && \
    chmod 0755 /usr/bin/jdownloader && \
    cpak-clean-junk
