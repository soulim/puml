ARG jdk_version="19"

FROM openjdk:${jdk_version}-jdk-alpine

ARG plantuml_version="1.2022.7"

ENV LANG="C.UTF-8"

COPY local.conf /etc/fonts/

RUN set -eux; \
    apk add --no-cache \
            graphviz \
            wget \
            ca-certificates \
            fontconfig \
            font-noto \
    && fc-cache --force \
                --verbose \
    && wget "https://github.com/plantuml/plantuml/releases/download/v${plantuml_version}/plantuml-${plantuml_version}.jar" \
            --output-document plantuml.jar \
    && apk del wget

ENTRYPOINT ["java", "-jar", "plantuml.jar", "-pipe"]
CMD ["-tsvg"]
