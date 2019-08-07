FROM rhscl/nodejs-4-rhel7:latest
MAINTAINER username <username@example.com>

EXPOSE	30080

COPY build /opt/app-root/src

RUN source scl_source enable rh-nodejs4 && \
    npm install --registry=http://services.lab.example.com:8081/nexus/content/groups/nodejs/

CMD	["/bin/bash","-c","./run.sh"]
