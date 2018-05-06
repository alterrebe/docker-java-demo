#! /bin/bash

cp ../../java/java9/jmods/alterrebe-test.jar .
docker build -t alterrebe-test:modular .
