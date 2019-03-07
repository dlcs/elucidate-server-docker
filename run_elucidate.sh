#!/bin/bash

aws s3 cp $S3_SETTINGS /opt/elucidate/elucidate.settings
aws s3 cp $S3_LOG_SETTINGS /opt/elucidate/elucidate.log4j.properties
aws s3 cp $S3_TOMCAT_LOG_SETTINGS /usr/local/tomcat/conf/logging.properties

export JAVA_OPTS="-Delucidate.server.properties=file:/opt/elucidate/elucidate.settings -Xms${MIN_HEAP:-1024}m -Xmx${MAX_HEAP:-2048}m -XX:MetaspaceSize=256m -XX:MaxMetaspaceSize=512m"

/usr/local/tomcat/bin/catalina.sh run
