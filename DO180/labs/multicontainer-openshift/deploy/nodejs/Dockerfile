FROM	do180/nodejs
MAINTAINER username <username@example.com>

#OCI-formatted Images do not support the ONBUILD instruction.
# The commands below are from the original Dockerfile,
# that generated a Docker-formatted container image for do180/nodejs.
#
#  ONBUILD COPY run.sh build ${HOME}/
#  ONBUILD RUN scl enable rh-nodejs4 'npm install --registry=http://services.lab.example.com:8081/nexus/content/groups/nodejs/'

COPY run.sh build ${HOME}/
RUN scl enable rh-nodejs4 'npm install --registry=http://services.lab.example.com:8081/nexus/content/groups/nodejs/'


EXPOSE	30080

CMD	["scl","enable","rh-nodejs4","./run.sh"]
