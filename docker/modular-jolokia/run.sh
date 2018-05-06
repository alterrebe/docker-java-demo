#! /bin/bash

docker run -d -p 8080:8080 -p 8778:8778 --name alterrebe-test alterrebe-test:modular-jolokia
