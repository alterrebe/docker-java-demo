FROM openjdk:8-jre-alpine

# Add our JAR and the shell script:
COPY test-server.jar run.sh /

EXPOSE 8080
ENTRYPOINT ["/bin/sh", "/run.sh"]

