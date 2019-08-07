FROM	rhel7:7.5
MAINTAINER username <username@example.com>

ENV 	NODEJS_VERSION=4.0 \
	HOME=/opt/app-root/src

ADD	training.repo /etc/yum.repos.d/training.repo

# The RUN command below is needed due to constraints
# of this static, disconnected instructional environment.  
# This RHEL 7.5 container is more up-to-date than the 
# lab enviroment's yum repositories.  This run command
# will ensure there are no dependency issues with 
# rh-nodejs4 package installed later. 
RUN	yum downgrade -y krb5-libs libstdc++ libcom_err


# Setting tsflags=nodocs helps create a leaner container 
# image, as documentation is not needed in the container. 
RUN	yum install -y --enablerepo rhel-server-rhscl-7-rpms --setopt=tsflags=nodocs \
          rh-nodejs4 && \
    	yum clean all -y

RUN	mkdir -p /opt/app-root && \
  	groupadd -r appuser -f -g 1001 && \
  	useradd -u 1001 -r -g appuser -m -d ${HOME} -s /sbin/nologin \
-c "Application User" appuser && \
  	chown -R appuser:appuser /opt/app-root && \
	chmod -R 755 /opt/app-root
ADD	./enable-rh-nodejs4.sh /etc/profile.d/

USER	appuser
WORKDIR	${HOME}


ONBUILD COPY run.sh build ${HOME}/
ONBUILD RUN scl enable rh-nodejs4 'npm install --registry=http://services.lab.example.com:8081/nexus/content/groups/nodejs/'

CMD	["echo", "You must create your own container from this one."]
