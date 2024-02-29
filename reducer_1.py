#reducer
import sys
from operator import itemgetter
from collections import defaultdict

# create a dictionary
hourly_ip_counts = defaultdict(lambda: defaultdict(int))

for line in sys.stdin:
    line = line.strip()
    hour_ip, count = line.split('\t')
    hour, ip = hour_ip.split(']')
    hour = hour[1:]
    #print('hour',hour,'ip',ip,'count',count)
    try:
        count = int(count)
        hourly_ip_counts[hour][ip] += count
    except ValueError:
        pass

# sort hours 
for hour in sorted(hourly_ip_counts.keys()):
    ips = hourly_ip_counts[hour]
    # get top 3
    sorted_top3_ips = sorted(ips.items(), key=itemgetter(1), reverse=True)[:3]
    print(f"\n\nHour {hour} top 3 IP:\n")
    for ip, count in sorted_top3_ips:
        print(f"{ip} count: {count}")