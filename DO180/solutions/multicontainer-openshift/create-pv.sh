#!/bin/bash
declare -a nodes=(node1 node2)
for node in ${nodes[@]}
 do
  ssh student@${node} sudo rm -rf /tmp/openshift/work
  ssh student@${node} sudo mkdir -p /tmp/openshift/work/data /tmp/openshift/work/init
  scp db.sql student@${node}:/home/student/
  ssh student@${node} sudo mv /home/student/db.sql /tmp/openshift/work/init/db.sql
  ssh student@${node} sudo chown -R 27:27  /tmp/openshift/work
  ssh student@${node} sudo chcon -Rt svirt_sandbox_file_t /tmp/openshift/work
 done
oc delete pv pv0001 &>/dev/null
oc create -f PV.json
oc delete pv pv0002 &>/dev/null
oc create -f PV2.json
