#!/bin/bash

aws s3 cp $S3_SETTINGS /opt/elucidate/elucidate.settings
aws s3 cp $S3_LOG_SETTINGS /opt/elucidate/elucidate.log4j.settings.xml

export JAVA_OPTS="-Delucidate.server.properties=file:/opt/elucidate/elucidate.settings"

cd /usr/local/tomcat/bin

./startup.sh

tail -f --follow=name /usr/local/tomcat/logs/*
