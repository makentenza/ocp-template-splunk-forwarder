# ocp-template-splunk-forwarder
OpenShift Template for Building and Deploying Splunk Forwarder.

$ oc project logging

$ oc create -f https://raw.githubusercontent.com/makentenza/ocp-template-splunk-forwarder/master/src/splunk-forwarder-template.yaml

$ oc new-app splunk-forwarder-template

$ oadm policy add-scc-to-user privileged system:serviceaccount:logging:splunk-forwarder
