# we expect rhel7.3 but use rhel7 to match the RHCSL MySQL image
FROM	rhel7:7.5

MAINTAINER username <username@example.com>

ENV	HOME /var/www/html

ADD training.repo /etc/yum.repos.d/training.repo

# The RUN command below is needed due to constraints
# of this static, disconnected instructional environment.
# This RHEL 7.5 container is more up-to-date than the
# lab enviroment's yum repositories.  This run command
# will ensure there are no dependency issues with
# rh-nodejs4 package installed later.
RUN yum downgrade -y krb5-libs libstdc++ libcom_err && \
    yum install -y --setopt=tsflags=nodocs \
    httpd \
    openssl-devel \
    procps-ng \
    which && \
    yum clean all -y && \
    rm -rf /var/cache/yum

EXPOSE  80

ONBUILD	COPY ./src/ ${HOME}/

CMD	["httpd", "-D", "FOREGROUND"]
