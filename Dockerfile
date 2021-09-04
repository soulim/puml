ARG jdk_version="18"

FROM openjdk:${jdk_version}-jdk-alpine

ARG plantuml_version="1.2021.9"

ENV LANG="C.UTF-8"

RUN set -eux; \
    apk add --no-cache graphviz \
                       wget \
                       ca-certificates \
                       ttf-dejavu \
                       fontconfig \
    && wget "http://downloads.sourceforge.net/project/plantuml/${plantuml_version}/plantuml.${plantuml_version}.jar" -O plantuml.jar \
    && apk del wget

ENTRYPOINT ["java", "-jar", "plantuml.jar", "-pipe"]
CMD ["-tsvg"]
