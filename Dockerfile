FROM docker.elastic.co/elasticsearch/elasticsearch:6.8.0


COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY config/elasticsearch.yml config/elasticsearch.yml
COPY config/setup.sh config/setup.sh
COPY config/downloadElasticIndices.sh config/downloadElasticIndices.sh
COPY config/configIndexUpdate.sh config/configIndexUpdate.sh
RUN mkdir utils
COPY utils/wait-for-it.sh utils/wait-for-it.sh

USER root
RUN ./config/downloadElasticIndices.sh
RUN chmod +x /docker-entrypoint.sh utils/wait-for-it.sh config/setup.sh
RUN chown -R elasticsearch:elasticsearch /docker-entrypoint.sh utils/wait-for-it.sh config/setup.sh

RUN yum install -y nano
RUN yum install -y net-tools
RUN yum install -y curl
RUN yum install -y unzip
RUN mkdir /usr/share/elasticsearch/backup/
RUN mv /usr/share/elasticsearch/backup.zip /usr/share/elasticsearch/backup/
RUN unzip /usr/share/elasticsearch/backup/backup.zip -d /usr/share/elasticsearch/backup/
RUN mv /usr/share/elasticsearch/backup/elbcp/* /usr/share/elasticsearch/backup/
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/backup 
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/logs 
RUN chown -R elasticsearch:elasticsearch config/configIndexUpdate.sh
RUN chmod 777 config/configIndexUpdate.sh
RUN rm -rf /usr/share/elasticsearch/backup/backup.zip
ARG INDEX

USER elasticsearch
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/share/elasticsearch/bin/elasticsearch"]
