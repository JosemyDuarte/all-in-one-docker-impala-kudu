#!/bin/bash

/etc/init.d/hadoop-hdfs-namenode start
/etc/init.d/hadoop-hdfs-datanode start
/etc/init.d/hive-metastore start
/etc/init.d/impala-state-store start
/etc/init.d/impala-catalog start
/etc/init.d/impala-server start
/etc/init.d/kudu-master start
/etc/init.d/kudu-tserver start

tail -f /var/log/kudu/kudu-master.INFO -f /var/log/kudu/kudu-tserver.INFO -f /var/log/impala/impalad.INFO -f /var/log/impala/catalogd.INFO -f /var/log/impala/statestored.INFO
