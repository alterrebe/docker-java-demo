#! /bin/bash

docker run -d -m 100m -p 8080:8080 --name alterrebe-test alterrebe-test:memleak
