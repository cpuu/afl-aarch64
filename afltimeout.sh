#!/bin/bash
TIMEOUT=$1
shift
/usr/bin/timeout -s 15 -k 3 $TIMEOUT afl-fuzz "$@"
