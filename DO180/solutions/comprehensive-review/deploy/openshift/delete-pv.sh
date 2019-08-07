#!/bin/bash
pv=nexus
oc login -u kubeadmin -p $(cat ~/.kubeadmin) --insecure-skip-tls-verify=true https://cluster-api.lab.example.com:6443
if oc get pv  | grep -q ${pv}; then
  oc delete pv pv-nexus
fi

declare -a nodes=( worker0 worker1 )
for node in ${nodes[@]}; do
  ssh core@${node} sudo rm -fr /tmp/openshift
done
