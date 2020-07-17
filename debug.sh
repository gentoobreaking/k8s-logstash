#!/bin/sh

bin/logstash --config.test_and_exit -f pipeline/logstash_bo_celery.conf > /tmp/logstash_bo_celery.log
bin/logstash --config.test_and_exit -f pipeline/logstash_bo_cronjob.conf > /tmp/logstash_bo_cronjob.log
bin/logstash --config.test_and_exit -f pipeline/logstash_bo_django.conf > /tmp/logstash_bo_django.log
bin/logstash --config.test_and_exit -f pipeline/logstash_bo_nginx.conf > /tmp/logstash_bo_nginx.log
bin/logstash --config.test_and_exit -f pipeline/logstash_bo_ui.conf > /tmp/logstash_bo_ui.log
bin/logstash --config.test_and_exit -f pipeline/logstash_nsports_api.conf > /tmp/logstash_nsports_api.log
bin/logstash --config.test_and_exit -f pipeline/logstash_nsports_consumer.conf > /tmp/logstash_nsports_consumer.log
bin/logstash --config.test_and_exit -f pipeline/logstash_nsports_cronjob.conf > /tmp/logstash_nsports_cronjob.log
bin/logstash --config.test_and_exit -f pipeline/logstash_nsports_iap.conf > /tmp/logstash_nsports_iap.log
bin/logstash --config.test_and_exit -f pipeline/logstash_nsports_mobile.conf > /tmp/logstash_nsports_mobile.log
bin/logstash --config.test_and_exit -f pipeline/logstash_nsports_nlp1.conf > /tmp/logstash_nsports_nlp1.log
bin/logstash --config.test_and_exit -f pipeline/logstash_nsports_nlp2.conf > /tmp/logstash_nsports_nlp2.log
bin/logstash --config.test_and_exit -f pipeline/logstash_nsports_nlp3.conf > /tmp/logstash_nsports_nlp3.log
bin/logstash --config.test_and_exit -f pipeline/logstash_nsports_socket.conf > /tmp/logstash_nsports_socket.log
bin/logstash --config.test_and_exit -f pipeline/logstash_nsports_sub.conf > /tmp/logstash_nsports_sub.log
bin/logstash --config.test_and_exit -f pipeline/logstash_nsport_transmit_au.conf > /tmp/logstash_nsport_transmit_au.log

sleep 1
grep -H "Config Validation Result" logstash*.log
# --- END --- #
