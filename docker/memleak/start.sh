#! /bin/bash

docker run -m 100m -d -p 8080:8080 --name alterrebe-test alterrebe-test:memleak
