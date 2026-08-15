FROM ubuntu:26.04 AS source

ADD --checksum=sha256:388a1d028e65cbc63933a778ddbc9267c14e7e7858389ce31a10be7308adeb40 https://installer.jdownloader.org/flatpak/2025-11-04/JDownloader.jar /stage/JDownloader.jar

FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/jdownloader"

COPY --from=source /stage/JDownloader.jar /opt/jdownloader/JDownloader.jar
COPY jdownloader /usr/bin/jdownloader
COPY jdownloader.desktop /usr/share/applications/jdownloader.desktop
COPY icon.png /usr/share/icons/hicolor/128x128/apps/jdownloader.png

RUN apt-get update && \
    apt-get install -y --no-install-recommends openjdk-21-jre && \
    chmod 0755 /usr/bin/jdownloader && \
    cpak-clean-junk

