#! /bin/bash

cp ../../java/java9-jolokia/jmods/alterrebe-test.jar .
docker build -t alterrebe-test:modular-jolokia .
