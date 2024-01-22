ARG jdk_version="22"
ARG os_version="bookworm"

FROM openjdk:${jdk_version}-jdk-${os_version}

ARG plantuml_version="1.2023.13"

ENV LANG="C.UTF-8"

COPY local.conf /etc/fonts/

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
