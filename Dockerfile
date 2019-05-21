FROM centos:7

WORKDIR /agent
RUN curl -OL https://cloud.mongodb.com/download/agent/automation/mongodb-mms-automation-agent-10.0.1.5755-1.rhel7_x86_64.tar.gz
RUN tar xf mongodb-mms-automation-agent-10.0.1.5755-1.rhel7_x86_64.tar.gz -C /agent --strip 1

COPY entrypoint.sh /agent
RUN chmod 700 entrypoint.sh

RUN mkdir -p /var/lib/mongodb-mms-automation /var/log/mongodb-mms-automation /data

CMD [ "/agent/entrypoint.sh" ]