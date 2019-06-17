FROM openjdk:8-jdk-alpine

ENV COLLECTOR_SERVER=127.0.0.1:12800

ADD startup.sh /usr/local/skywalking-solr-scenario/
ADD solrj-scenario.jar /usr/local/skywalking-solr-scenario/

ADD docker-entrypoint.sh /
RUN chmod +x /usr/local/skywalking-solr-scenario/startup.sh && chmod +x /docker-entrypoint.sh

EXPOSE 8080

VOLUME /usr/local/skywalking-solr-scenario/agent
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/local/skywalking-solr-scenario/startup.sh"]