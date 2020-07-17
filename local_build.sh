#!/bin/sh

#export my_container="$(echo $PWD|awk -F'/' '{print $NF}')"
export my_container="nsports-logstash"
export my_version='v0.0.1'

docker build -t "${my_container}":"${my_version}" .

# --- END --- #
