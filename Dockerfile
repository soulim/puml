ARG jdk_version="8u412-b08"
ARG os_version="jammy"

FROM eclipse-temurin:${jdk_version}-jdk-${os_version}

ARG plantuml_version="1.2024.6"

ENV LANG="C.UTF-8"

RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends \
                    --assume-yes \
                    --auto-remove \
                    graphviz \
                    wget \
                    ca-certificates \
                    fontconfig \
                    fonts-noto \
    && fc-cache --force \
                --verbose \
    && wget "https://github.com/plantuml/plantuml/releases/download/v${plantuml_version}/plantuml-${plantuml_version}.jar" \
            --output-document plantuml.jar \
    && apt-get purge --assume-yes \
                     wget \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists

ENTRYPOINT ["java", "-jar", "plantuml.jar", "-pipe"]
CMD ["-tsvg"]
