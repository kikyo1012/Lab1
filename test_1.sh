bash start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal /access.log /input/

#read -p "Enter the hour range (e.g., 0-1): " hour_range

/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar \
#-file /mapper_1.py -mapper "python mapper_1.py $hour_range" \
-file /mapper_1.py -mapper /mapper_1.py \

-file /reducer_1.py -reducer /reducer_1.py \
-input /input/* -output /output/
/usr/local/hadoop/bin/hdfs dfs -cat /output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /output/
bash stop.sh
