ARG plantuml_version="1.2025.2"

FROM ghcr.io/plantuml/plantuml:${plantuml_version}

ENV PLANTUML_LIMIT_SIZE=8192

RUN set -eux; \
    apt-get update \
    && apt-get install --no-install-recommends \
                       --assume-yes \
                       --auto-remove \
                       fonts-noto \
                       fonts-noto-mono \
                       fonts-firacode \
    && fc-cache --force \
                --verbose \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists

ENTRYPOINT ["java", "-jar", "/opt/plantuml.jar", "-pipe"]
CMD ["-tsvg"]
