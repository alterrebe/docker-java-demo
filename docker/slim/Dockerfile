# Use openjdk:latest <-- from Debian Stretch Slim and JRE8
FROM openjdk:8-jre-slim

# Add our JAR
COPY test-server.jar /

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/test-server.jar"]
