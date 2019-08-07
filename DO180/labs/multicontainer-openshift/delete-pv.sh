#!/bin/bash

function delete_pv() {
  if oc get pv $1 2> /dev/null; then
    oc delete pv $1
  else
    echo "The PV $1 doesn't exist; nothing to delete."
  fi
}


declare -a nodes=(worker0 worker1)
for node in ${nodes[@]}
 do
  ssh core@${node} sudo rm -fvr /tmp/openshift
  echo $?
 done


delete_pv pv0001
delete_pv pv0002





