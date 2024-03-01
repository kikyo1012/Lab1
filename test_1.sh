bash start.sh
/usr/local/hadoop/bin/hdfs dfs -rm -r /Lab1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /Lab1/output/
/usr/local/hadoop/bin/hdfs dfs -mkdir -p /Lab1/input/
/usr/local/hadoop/bin/hdfs dfs -copyFromLocal ../Lab1/access.log /Lab1/input/

#read -p "Enter the hour range (e.g., 0-1): " hour_range

/usr/local/hadoop/bin/hadoop jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar \
#-file ../Lab1/mapper_1.py -mapper "python mapper_1.py $hour_range" \
-file ../Lab1/mapper_1.py -mapper ../Lab1/mapper_1.py \

-file ../Lab1/reducer_1.py -reducer ../Lab1/reducer_1.py \
-input /Lab1/input/* -output /Lab1/output/
/usr/local/hadoop/bin/hdfs dfs -cat /Lab1/output/part-00000
/usr/local/hadoop/bin/hdfs dfs -rm -r /Lab1/input/
/usr/local/hadoop/bin/hdfs dfs -rm -r /Lab1/output/
bash stop.sh
