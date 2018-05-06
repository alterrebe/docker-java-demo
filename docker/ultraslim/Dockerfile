FROM openjdk:8-jre-alpine

# Add our JAR
COPY test-server.jar /

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/test-server.jar"]
