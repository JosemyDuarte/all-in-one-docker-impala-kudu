[![Build Status](https://travis-ci.org/JosemyDuarte/all-in-one-docker-impala-kudu.svg?branch=master)](https://travis-ci.org/JosemyDuarte/all-in-one-docker-impala-kudu)

# Kudu/Impala container from CDH5 stack

This is a standalone container which has Apache Kudu and Impala installed with dependencies (HDFS, Hive etc).

## Run container

```
docker run -d -net=host josemyd/all-in-one-impala-kudu
```

List of ports:

* [CDH Ports](http://www.cloudera.com/documentation/enterprise/latest/topics/cdh_ig_ports_cdh5.html)
* [Impala Ports](http://www.cloudera.com/content/www/en-us/documentation/enterprise/latest/topics/cm_ig_ports_impala.html)

## Tags

* [cdh5.15.1](https://github.com/JosemyDuarte/all-in-one-docker-impala-kudu/blob/cdh5.15.1/Dockerfile), [latest](https://github.com/JosemyDuarte/all-in-one-docker-impala-kudu/blob/master/Dockerfile)
* [cdh5.14.2](https://github.com/JosemyDuarte/all-in-one-docker-impala-kudu/blob/cdh5.14.2/Dockerfile)