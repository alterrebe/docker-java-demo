# Use openjdk:latest <-- from Debian Stretch and JDK8
FROM openjdk

# Add our JAR
COPY test-server.jar /

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/test-server.jar"]
