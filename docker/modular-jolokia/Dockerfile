# Unfortunately the latest 'openjdk' image based on Alpine is for JDK8
# Let's create JDK11 image ourselves, using latest Alpine and the OpenJDK binaries for 'musl' library
FROM alpine as builder

ARG OPENJDK11_ALPINE_URL=https://download.java.net/java/early_access/alpine/11/binaries/openjdk-11-ea+11_linux-x64-musl_bin.tar.gz

RUN apk update \
  && apk add ca-certificates wget \
  && mkdir -p /usr/lib/jvm \
  && wget -c -O- $OPENJDK11_ALPINE_URL \
    | tar -zxC /usr/lib/jvm

ENV LANG C.UTF-8
ENV JAVA_HOME /usr/lib/jvm/jdk-11
ENV PATH=$PATH:$JAVA_HOME/bin

# Add our JAR:
COPY alterrebe-test.jar /jmods/alterrebe-test.jar

# Build custom JRE
ENV SYSTEM_JMODS=$JAVA_HOME/jmods
RUN jlink --module-path /jmods:$SYSTEM_JMODS --add-modules alterrebe.test --output /jre-native \
          --strip-debug --vm server --compress 2 --class-for-name --no-header-files --no-man-pages \
          --dedup-legal-notices=error-if-not-same-content 

# Create the target container:
FROM alpine
COPY --from=builder /jre-native /app

# Add Jolokia
ADD https://repo1.maven.org/maven2/org/jolokia/jolokia-jvm/1.3.7/jolokia-jvm-1.3.7-agent.jar /
RUN mv /jolokia-jvm-*.jar /jolokia.jar

EXPOSE 8080 8778
ENTRYPOINT ["/app/bin/java", "-javaagent:/jolokia.jar=port=8778,host=0.0.0.0", "-m", "alterrebe.test"]
