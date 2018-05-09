FROM openjdk:8-jre-alpine

# Add our JAR
COPY test-server.jar /

EXPOSE 8080
ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-jar", "/test-server.jar"]
