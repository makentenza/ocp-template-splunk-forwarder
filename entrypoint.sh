#!/bin/bash

set -e

if [ "$1" = 'splunk' ]; then
  shift
  ${SPLUNK_BIN} "$@"
elif [ "$1" = 'start-service' ]; then
  ${SPLUNK_BIN} set deploy-poll ${SPLUNK_SERVER} --accept-license
  ${SPLUNK_BIN} start --accept-license
  #${SPLUNK_BIN} enable listen 9997 -auth admin:changeme
  trap "${SPLUNK_BIN} stop" SIGINT SIGTERM EXIT
  tail -n 0 -f ${SPLUNK_HOME}/var/log/splunk/splunkd_stderr.log -f ${SPLUNK_HOME}/var/log/splunk/splunkd.log &
  wait
else
  "$@"
fi
