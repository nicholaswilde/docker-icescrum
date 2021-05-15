FROM adoptopenjdk/openjdk8:jdk8u-ubuntu-nightly-slim
LABEL maintainer="Nicholas Wilde <ncwilde43@gmail.com>"
ARG CHECKSUM
ENV JAVA_OPTS -Xmx1024m -Dicescrum.log.dir=/root/logs/ -Dicescrum.environment=docker

# Anything done in root cannot be done in Dockerfile since root will be mounted to a host directory at runtime
WORKDIR /icescrum
COPY entrypoint.sh .
ADD https://www.icescrum.com/downloads/v7/icescrum.jar .
RUN  echo "${CHECKSUM}  icescrum.jar" | sha256sum -c
EXPOSE 8080
CMD ["./entrypoint.sh"]
