#! /bin/bash

curl http://localhost:8080/

# curl 'http://localhost:8778/jolokia/read/java.lang:type=Memory/HeapMemoryUsage,NonHeapMemoryUsage' | jq .
