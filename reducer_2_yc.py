#!/usr/bin/python3
#reducer
import sys
from operator import itemgetter
from collections import defaultdict


ip_counts = defaultdict(int)

# aggregate
for line in sys.stdin:
    hour, ip, count = line.strip().split('\t')
    ip_counts[ip] += int(count)

# get top 3
top_ips = sorted(ip_counts.items(), key=lambda x: x[1], reverse=True)[:3]

# output
for ip, count in top_ips:
    print("{}\t{}".format(ip, count))

