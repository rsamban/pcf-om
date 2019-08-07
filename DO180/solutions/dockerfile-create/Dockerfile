FROM rhel7:7.5

MAINTAINER username <username@example.com>

LABEL description="A basic Apache container on RHEL 7"

ADD training.repo /etc/yum.repos.d/training.repo

RUN yum install -y httpd && \
yum clean all

RUN echo "Hello from Dockerfile" > /usr/share/httpd/noindex/index.html

EXPOSE 80

ENTRYPOINT ["httpd", "-D", "FOREGROUND"]
