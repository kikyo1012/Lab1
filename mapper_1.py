#!/usr/bin/python3
import re
import sys

pattern = re.compile(r'(?P<ip>\d+\.\d+\.\d+\.\d+).*?\[(?:\d{2}/\w{3}/\d{4}):(?P<hour>\d{2}):\d{2}:\d{2} \+\d{4}\].*?')

for line in sys.stdin:
    line = line.strip()
    match = pattern.search(line)
    if match:
        print('%s\t%s' % ('[' + match.group('hour') + ':00]' + match.group('ip'), 1))
