#! /bin/bash

docker run -d -m 100m -p 8080:8080 -p 8778:8778 --name alterrebe-test alterrebe-test:runshell
