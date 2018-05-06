#! /bin/bash

mvn clean package

# Install module to the jmods folder:
rm -rf jmods
mkdir jmods
mv target/test-*.jar jmods/alterrebe-test.jar

# Unfortunately maven-jar-plugin does not support update of module-info.class
# See https://issues.apache.org/jira/browse/MJAR-238 for details
jar --main-class alterrebe.test.Server --module-version 0.1 --update --file  jmods/alterrebe-test.jar

# Now build the native JRE
rm -rf jre-native

export SYSTEM_JMODS=/Library/Java/JavaVirtualMachines/jdk-10.jdk/Contents/Home/jmods

# Basic usage:
#jlink --module-path jmods:$SYSTEM_JMODS --add-modules alterrebe.test --output jre-native

# See jlink docs for options:  https://docs.oracle.com/javase/9/tools/jlink.htm
jlink --module-path jmods:$SYSTEM_JMODS --add-modules alterrebe.test --output jre-native \
	--strip-debug --vm server --compress 2 --class-for-name --exclude-jmod-section=headers \
	--exclude-jmod-section=man --dedup-legal-notices=error-if-not-same-content
