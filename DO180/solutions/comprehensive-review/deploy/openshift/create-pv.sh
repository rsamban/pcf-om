#!/bin/bash
pv=nexus

if oc get pv  | grep -q ${pv}; then
  oc delete pv pv-nexus
fi

declare -a nodes=( worker0 worker1 )
for node in ${nodes[@]}; do
  echo "Creating volume in $node"
  sudo ssh core@${node} \
    "sudo rm -fr /tmp/openshift && \
    sudo mkdir -p /tmp/openshift/work && \
    sudo chcon -Rt svirt_sandbox_file_t /tmp/openshift/work && \
    sudo chown 1001:1001 /tmp/openshift/work"
done
oc create -f resources/pv.yaml


