
# splunk-forwarder
FROM registry.access.redhat.com/rhel7.2

MAINTAINER Marcos Entenza mak@redhat.com

ENV BUILDER_VERSION 1.0
ENV SPLUNK_RPM rpm/splunkforwarder-6.5.0-59c8927def0f-linux-2.6-x86_64.rpm
ENV SPLUNK_HOME /opt/splunkforwarder
ENV SPLUNK_BIN $SPLUNK_HOME/bin/splunk
ENV SPLUNK_SERVER 172.19.5.3:8089

LABEL io.k8s.description="Splunk forwarder agent" \
      io.k8s.display-name="Splunk Forwarder" \
      io.openshift.expose-services="8089:tcp" \
      io.openshift.tags="splunk"

WORKDIR /root/
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
COPY $SPLUNK_RPM .
RUN rpm -ivh *.rpm && rm -rf *.rpm

VOLUME ["/host/log"]

ENTRYPOINT ["/root/entrypoint.sh"]
CMD ["start-service"]

EXPOSE 8089

USER root
