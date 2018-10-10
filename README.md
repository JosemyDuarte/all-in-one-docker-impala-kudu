[![Build Status](https://travis-ci.org/josemyduarte/docker-impala-kudu.svg?branch=master)](https://travis-ci.org/josemyduarte/docker-impala-kudu)

# Kudu/Impala container from CDH5 stack

This is a standalone container which has Apache Kudu and Impala installed with dependencies (HDFS, Hive etc).

## Run container

```
docker run -d -p 8050:8050 -p 8051:8051 -p 21050:21050 -p 25000:25000 -p 25010:25010 -p 25020:25020 -p 50070:50070 -p 50075:50075 josemyd/impala-kudu:latest
```

List of ports:

* [CDH Ports](http://www.cloudera.com/documentation/enterprise/latest/topics/cdh_ig_ports_cdh5.html)
* [Impala Ports](http://www.cloudera.com/content/www/en-us/documentation/enterprise/latest/topics/cm_ig_ports_impala.html)
