FROM openjdk:8-jre-alpine

# Add Jolokia
ADD https://repo1.maven.org/maven2/org/jolokia/jolokia-jvm/1.3.7/jolokia-jvm-1.3.7-agent.jar /
RUN mv /jolokia-jvm-*.jar /jolokia.jar

# Add our JAR
COPY test-server.jar /

EXPOSE 8080 8778
ENTRYPOINT ["java", "-javaagent:/jolokia.jar=port=8778,host=0.0.0.0", "-jar", "/test-server.jar"]
