#! /bin/bash

if [ ! -f jolokia.jar ]; then
	curl -o jolokia.jar https://repo1.maven.org/maven2/org/jolokia/jolokia-jvm/1.3.7/jolokia-jvm-1.3.7-agent.jar
fi

./jre-native/bin/java -javaagent:./jolokia.jar=port=8778,host=0.0.0.0 -m alterrebe.test
