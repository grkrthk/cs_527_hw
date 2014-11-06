#!/bin/bash
project=trunk
home=~/ekstazi/
cwd=`pwd`

# Print info about the machine.
cat /proc/cpuinfo > cpu.info
cat /proc/meminfo > mem.info

function hw() {
    # Clone the project.
    svn co http://svn.apache.org/repos/asf/commons/proper/lang/trunk
    # Go to a specific revision.
    ( cd ${project}; svn up -r 1568639 )
    ( cp pom_rev_1568639.xml ./trunk/pom.xml )
    ( cd ${project}; mvn test )

    ( cd ${project}; svn up -r 1568612 )
    ( cp pom_rev_1568612.xml ./trunk/pom.xml )
    ( cd ${project}; mvn test )
    
    ( cd ${project}; svn up -r 1567801 )
    ( cp pom_rev_1567801.xml ./trunk/pom.xml )
    ( cd ${project}; mvn test )
    
    ( cd ${project}; svn up -r 1567799 )
    ( cp pom_rev_1567799.xml ./trunk/pom.xml )
    ( cd ${project}; mvn test )

    ( cd ${project}; svn up -r 1567796 )
    ( cp pom_rev_1567796.xml ./trunk/pom.xml )
    ( cd ${project}; mvn test )
}
# Step 1 of the homework.
    mkdir ~/ekstazi 
    ( cd ${home}; wget http://mir.cs.illinois.edu/gliga/projects/ekstazi/release/org.ekstazi.core-3.5.0.jar )
    ( cd ${home}; wget http://mir.cs.illinois.edu/gliga/projects/ekstazi/release/ekstazi-maven-plugin-3.5.0.jar )
    ( cd ${home};  mvn install:install-file -Dfile=org.ekstazi.core-3.5.0.jar -DgroupId=org.ekstazi -DartifactId=org.ekstazi.core -Dversion=3.5.0 -Dpackaging=jar -DlocalRepositoryPath=$HOME/.m2/repository/ )
    ( cd ${home}; mvn install:install-file -Dfile=ekstazi-maven-plugin-3.5.0.jar -DgroupId=org.ekstazi -DartifactId=ekstazi-maven-plugin -Dversion=3.5.0 -Dpackaging=jar -DlocalRepositoryPath=$HOME/.m2/repository/ )
    hw | tee step1.txt
    sed -i 's/.*'"${cwd//\//\\/}"'/USER/g' step1.txt   
