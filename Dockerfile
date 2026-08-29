ARG plantuml_version="1.2026.7"

FROM ghcr.io/plantuml/plantuml:${plantuml_version}

ENV PLANTUML_LIMIT_SIZE=8192

USER root

RUN set -eux; \
  apt-get update \
  && apt-get install --no-install-recommends --assume-yes --auto-remove \
  fonts-noto \
  fonts-noto-mono \
  fonts-jetbrains-mono \
  fonts-ibm-plex \
  && fc-cache --force --verbose \
  && apt-get autoremove \
  && apt-get clean

USER appuser

ENTRYPOINT ["java", "-jar", "/opt/plantuml.jar", "-pipe"]
CMD ["-tsvg"]
