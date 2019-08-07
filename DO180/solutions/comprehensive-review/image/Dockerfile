FROM rhel7:7.5

MAINTAINER username <username@example.com>

ENV NEXUS_VERSION=2.14.3-02 \
    NEXUS_HOME=/opt/nexus

ADD training.repo /etc/yum.repos.d/training.repo

RUN yum install -y --setopt=tsflags=nodocs java-1.8.0-openjdk-devel && \
    yum clean all -y

RUN groupadd -r nexus -f -g 1001 && \
    useradd -u 1001 -r -g nexus -m -d ${NEXUS_HOME} \
            -s /sbin/nologin \
            -c "Nexus User" nexus && \

ADD nexus-${NEXUS_VERSION}-bundle.tar.gz ${NEXUS_HOME}/
ADD nexus-start.sh ${NEXUS_HOME}/

RUN ln -s ${NEXUS_HOME}/nexus-${NEXUS_VERSION} \
          ${NEXUS_HOME}/nexus2 && \
    chown -R nexus:nexus ${NEXUS_HOME}

USER nexus
WORKDIR ${NEXUS_HOME}

VOLUME ["/opt/nexus/sonatype-work"]

CMD ["sh", "nexus-start.sh"]
