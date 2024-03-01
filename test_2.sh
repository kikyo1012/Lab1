#!/bin/sh
export TIME_RANGE=$1
../../start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /logstat2/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../mapreduce-test-data/access.log /logstat/input/
/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar \
-files ../../mapreduce-test-python/logstat/mapper.py,../../mapreduce-test-python/logstat2/reducer.py \
-mapper "mapper.py" \
-reducer "reducer.py" \
-input /logstat2/input/* -output /logstat2/output/ \
-cmdenv TIME_RANGE=$TIME_RANGE
/usr/local/hadoop/bin/hdfs dfs -cat /logstat2/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/output/
../../stop.sh