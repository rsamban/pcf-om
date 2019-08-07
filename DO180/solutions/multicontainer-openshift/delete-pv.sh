#!/bin/bash
declare -a nodes=(node1 node2)
for node in ${nodes[@]}
 do
  ssh student@${node} sudo rm -fr /tmp/openshift
 done 
oc delete pv pv0001
oc delete pv pv0002
