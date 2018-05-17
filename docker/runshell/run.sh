#! /bin/sh
# Note that the shell is plain Bourne shell, not BASH!

set -eu

# Check if MEMLIMIT - the available memory volume in MB - is defined:
if [ -z ${MEMLIMIT:-} ]; then
	# Set MEMLIMIT based on the cgroup setting that is available from inside the container:
	MEMLIMIT=$(( $(cat /sys/fs/cgroup/memory/memory.limit_in_bytes) / 1024 / 1024 ))
fi

# Now use our own heuristic: get 70% of the limit as a MaxHeap:
MEM_OPT="-Xmx$(( $MEMLIMIT * 70 / 100 ))m"

# Sometimes it is suggested to use -Xms equal to -Xmx, but it is up to you

JAVA_OPTS="-server $MEM_OPT"  # feel free to specify your GC of choice, etc.

exec java $JAVA_OPTS -javaagent:/jolokia.jar=port=8778,host=0.0.0.0 -jar /test-server.jar
