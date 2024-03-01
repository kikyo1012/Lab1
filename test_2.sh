#!/bin/sh
  
../../start.sh

/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /logstat2/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../../mapreduce-test-data/access.log /logstat2/input/

read -p "enter the hour range (e.g., 00-03): " TIME_RANGE

/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar \
-files ../../mapreduce-test-python/logstat2/mapper.py,../../mapreduce-test-python/logstat2/reducer.py \
-mapper "python mapper.py $TIME_RANGE" \
-reducer "python reducer.py" \
-input /logstat2/input/* -output /logstat2/output/

/usr/local/hadoop/bin/hdfs dfs -cat /logstat2/output/part-00000

/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /logstat2/output/

../../stop.sh
