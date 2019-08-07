FROM    rhel7:7.5

MAINTAINER username <username@example.com>

ENV     NODEJS_VERSION=4.0 \
        HOME=/opt/app-root/src

ADD     training.repo /etc/yum.repos.d/training.repo

# The RUN command below is needed due to constraints
# of this static, disconnected instructional environment.
# The RHEL 7.5 container used here is more up-to-date than
# the lab enviroment's yum repositories.  In a normal
# internet-connect environment, the RUN instruction below
# would not be present.
RUN		yum downgrade -y krb5-libs libstdc++ libcom_err && \
    	yum clean all

#  - Install Red Hat Software Collection (rhscl) for NodeJS 4
#  - The tsflags=nodocs is used so that documentation is not
#    installed into the container to keep image size down.
RUN     yum install -y --enablerepo rhel-server-rhscl-7-rpms --setopt=tsflags=nodocs \
            rh-nodejs4 \
            && \
    	yum clean all -y && \
		mkdir -p /opt/app-root && \
  		groupadd -r appuser -f -g 1001 && \
  		useradd -u 1001 -r -g appuser -m -d ${HOME} -s /sbin/nologin \
            -c "Application User" appuser && \
  		chown -R appuser:appuser /opt/app-root && \
		chmod -R 755 /opt/app-root

ADD	./enable-rh-nodejs4.sh /etc/profile.d/

USER	appuser
WORKDIR	${HOME}

CMD	["echo", "You must create your own container from this one."]
