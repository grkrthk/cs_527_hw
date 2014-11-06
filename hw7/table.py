import re
import time
import sys

flag1 = 0
flag2 = 0
flag3 = 0
file_name = sys.argv[1]
fpage = open(file_name, 'r')
fptrc = open(sys.argv[2],"w")
for line in iter(fpage.readline, ''):
    if ("Updated to revision" in line):
               flag1 = 1
               revision =  line.strip("Updated to revision")

    if ("Results :" in line):
               flag2 = 1 
    if (flag1 == 1 and flag2 == 1):
               if ("Tests run:" in line):
                      tests_run = re.search('Tests run: [0-9]+', line)                      
               if ("Total time:" in line):
                      total_time = re.search('Total time: [0-9:\.]*[s]+', line)
                      flag3 = 1
                      
                      print >> fptrc, tests_run.group(0), ",", total_time.group(0)

    if (flag1 == 1 and flag2==1 and flag3==1):
               flag1 = 0
               flag2 = 0
               flag3 = 0

         
  
