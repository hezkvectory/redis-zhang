FROM mysql:5.7
RUN mkdir -p /opt
ADD ./data/thpcloud.sql /opt/
RUN chmod 777 -R /tmp
