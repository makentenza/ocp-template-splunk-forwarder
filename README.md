# ocp-template-splunk-forwarder
OpenShift Template for Building and Deploying Splunk Forwarder.

$ oc project logging

$ oc create -f https://raw.githubusercontent.com/makentenza/ocp-template-splunk-forwarder/master/src/splunk-forwarder-template.yaml

$ oc new-app splunk-forwarder-template

$ oadm policy add-scc-to-user privileged system:serviceaccount:logging:splunk-forwarder

# List of objets created from Template

--> Deploying template "splunk-forwarder-template" in project "openshift"

     splunk-forwarder-template
     ---------
     Splunk Forwarder Agent

     A Splunk Forwarder has been created

--> Creating resources with label app=splunk-forwarder-template ...
    serviceaccount "splunk-forwarder" created
    imagestream "splunk-forwarder" created
    buildconfig "splunk-forwarder" created
    deploymentconfig "splunk-forwarder" created
