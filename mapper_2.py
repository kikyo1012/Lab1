#!/usr/bin/python3
#mapper 2 

import sys
import re
import os

# get command input as parameter for time range
time_range = os.environ.get('TIME_RANGE', '00-23') # time range example "00-01"
start_hour, end_hour = time_range.split('-')
start_hour, end_hour = start_hour.zfill(2), end_hour.zfill(2)

pattern = re.compile(r'(?P<ip>\d+\.\d+\.\d+\.\d+).*?\[(?:\d{2}/\w{3}/\d{4}):(?P<hour>\d{2}):\d{2}:\d{2} \+\d{4}\].*?')

for line in sys.stdin:
    match = pattern.search(line)
    if match:
        hour = match.group('hour')
        if start_hour <= hour <= end_hour:
            print("{}\t{}\t1".format(hour, match.group('ip')))

