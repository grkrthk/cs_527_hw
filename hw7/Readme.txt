
STEP1:
-----

* Execute the script 'step1_script.sh' with the following files present in the
 current directory.

> pom_rev_1567796.xml
> pom_rev_1567799.xml
> pom_rev_1567801.xml
> pom_rev_1568612.xml
> pom_rev_1568639.xml

'step1_script.sh' generates 'step1.txt'. 

Execute table.py by providing appropriate arguments.

> python table.py step1.txt table1.txt

Use the above command to generate 'table1.txt'

STEP2:
-----

* Execute the script 'step2_script.sh'. This generates 'step2.txt'

Execute table.py to generate 'table2.txt'

> python table.py step2.txt table2.txt

STEP3:
-----

* Execute the script 'step3_script_ekstazi.sh' with the following file present
 in the current directory.

> pom_CommonPool.xml

'step3_script_ekstazi.sh' generates 'step3.txt'. Now use table.py to generate
table3.txt

> python table.py step3.txt table3.txt

Note: 'pom_CommonPool.xml' is the modified version of pom.xml (suited for
ekstazi). It is copied once for the initial version and is kept the same.
Since there weren't any merge conflicts across the revisions.

