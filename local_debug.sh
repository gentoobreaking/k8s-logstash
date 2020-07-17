#!/bin/sh

#export my_container="$(echo $PWD|awk -F'/' '{print $NF}')"
export my_container="nsports-logstash"
export my_version='v0.0.1'

docker run -it "${my_container}":"${my_version}" /bin/bash

# --- END --- #
