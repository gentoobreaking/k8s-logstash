# --- nsports-logstash --- #

ARG ELK_VERSION=7.5.0
# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash:${ELK_VERSION}

MAINTAINER David Chen <david@funpodium.net>
LABEL maintainer="David Chen <david@funpodium.net>"

ENV RELEASE   1

USER root
RUN echo 'root:RootPW' | chpasswd
RUN yum -y update && yum -y install net-tools && \
    yum clean all

USER 1000
WORKDIR /usr/share/logstash

ENV ELASTIC_CONTAINER true
ENV PATH=/usr/share/logstash/bin:$PATH

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json

RUN logstash-plugin install logstash-input-tcp
RUN logstash-plugin install logstash-filter-json
RUN logstash-plugin install logstash-filter-geoip
RUN logstash-plugin install logstash-output-elasticsearch

ENV ELASTICSEARCH_HOST="elasticsearch" \
    ELASTICSEARCH_PORT="9200" \
    ELASTICSEARCH_USER="user" \
    ELASTICSEARCH_PASS="password"

# testing
ENV ELASTICSEARCH_HOST="es-cn-xxx.public.elasticsearch.aliyuncs.com"
ENV ELASTICSEARCH_HOSTS="${ELASTICSEARCH_HOST}:${ELASTICSEARCH_PORT}"

# Provide a minimal configuration, so that simple invocations will provide
# a good experience.
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
COPY ./config/logstash.yml config/
COPY ./config/pipelines.yml config/
COPY ./pipeline/*.conf pipeline/
COPY ./debug.sh ./

# Ensure Logstash gets a UTF-8 locale by default.
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

# Place the startup wrapper script.
#ADD bin/docker-entrypoint /usr/local/bin/
#RUN chmod 0755 /usr/local/bin/docker-entrypoint

USER 1000

EXPOSE 9600 5044

ENTRYPOINT ["/usr/local/bin/docker-entrypoint"]

# --- END --- #
