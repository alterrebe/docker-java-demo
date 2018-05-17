#! /bin/bash

docker run -m 100m -d -p 8080:8080 -p 8778:8778 --name alterrebe-test alterrebe-test:memleak
