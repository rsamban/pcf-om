#!/bin/bash
declare -a nodes=(worker0 worker1)
for node in ${nodes[@]}
 do
  sudo ssh core@${node} sudo rm -rf /tmp/openshift/work
  sudo ssh core@${node} sudo mkdir -p /tmp/openshift/work/data /tmp/openshift/work/init
  sudo scp db.sql core@${node}:/home/core
  sudo ssh core@${node} sudo mv /home/core/db.sql /tmp/openshift/work/init/db.sql
  sudo ssh core@${node} "sudo semanage fcontext -a -t container_file_t '/tmp/openshift/work(/.*)?'"
  sudo ssh core@${node} sudo restorecon -R /tmp/openshift/work
  sudo ssh core@${node} sudo chown -R 27:27  /tmp/openshift/work
 done
oc delete pv pv0001 &>/dev/null
oc create -f PV.json
oc delete pv pv0002 &>/dev/null
oc create -f PV2.json



