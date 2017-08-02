#!/bin/bash

aws s3 cp $S3_SETTINGS /opt/elucidate/elucidate.settings
aws s3 cp $S3_LOG_SETTINGS /opt/elucidate/elucidate.log4j.settings.xml

export JAVA_OPTS="-Delucidate.server.properties=file:/opt/elucidate/elucidate.settings -Xms${MIN_HEAP:-1024}m -Xmx${MAX_HEAP:-2048}m -XX:MetaspaceSize=256m -XX:MaxMetaspaceSize=512m"

cd /usr/local/tomcat/bin

./startup.sh

tail -f --follow=name /usr/local/tomcat/logs/*
