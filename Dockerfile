FROM centos:7

ADD cloudera-impala-kudu.repo /etc/yum.repos.d/
ADD cloudera-cdh5.repo /etc/yum.repos.d/

RUN rpm --import http://archive.cloudera.com/beta/impala-kudu/redhat/7/x86_64/impala-kudu/RPM-GPG-KEY-cloudera \
    && yum update -y \
    && yum install -y \
    java-1.8.0-openjdk \
    java-1.8.0-openjdk-devel \
    hadoop-hdfs-namenode \
    hadoop-hdfs-datanode hive hive-metastore \
    impala impala-catalog impala-server \
    impala-state-store impala-shell \
    kudu-master kudu-tserver \
    rsyslog \
    && yum clean all

RUN alternatives --install /usr/bin/java jar /usr/java/latest/bin/java 200000
RUN alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 200000
RUN alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000

COPY ./etc /etc/cdh/
COPY ./default/impala /etc/default/impala

RUN echo "Configuring Hadoop, Hive and Impala" \
 && ln -sf /etc/cdh/core-site.xml /etc/hadoop/conf/  \
 && ln -sf /etc/cdh/hdfs-site.xml /etc/hadoop/conf/  \
 && ln -sf /etc/cdh/hive-site.xml /etc/hive/conf/  \
 && ln -sf /etc/cdh/hdfs-site.xml /etc/impala/conf/  \
 && ln -sf /etc/cdh/core-site.xml /etc/impala/conf/  \
 && ln -sf /etc/cdh/hive-site.xml /etc/impala/conf/  \
 && mkdir -p /var/run/hdfs-sockets \
 && chown hdfs:hadoop /var/run/hdfs-sockets \
 && echo "Formatting HDFS..." \
 && service hadoop-hdfs-namenode init \
 && echo "--use_hybrid_clock=false" >> /etc/kudu/conf/master.gflagfile \
 && echo "--use_hybrid_clock=false" >> /etc/kudu/conf/tserver.gflagfile

VOLUME /var/lib/hadoop-hdfs /var/lib/hive /var/lib/impala /var/lib/kudu

EXPOSE 7050 7051 8020 8050 8051 9083 15000 15001 15002 21000 21050 22000 23000 23020 24000 25000 25010 26000 28000 50010 25020 50070 50075

COPY ./docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
