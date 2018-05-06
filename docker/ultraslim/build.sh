#! /bin/bash

cp ../../java/java8/target/test-1.0-SNAPSHOT.jar test-server.jar
docker build -t alterrebe-test:ultraslim .
