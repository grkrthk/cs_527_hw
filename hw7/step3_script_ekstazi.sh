#!/bin/bash
project=pool/trunk/
home=~/ekstazi/
cwd=`pwd`

# Print info about the machine.
cat /proc/cpuinfo > cpu.info
cat /proc/meminfo > mem.info

function hw() {
    # Clone the project.
    svn co http://svn.apache.org/repos/asf/commons/proper/pool/
    # Go to a specific revision.
    ( cd ${project}; svn up -r 1622750 )
    ( cp pom_CommonPool.xml ./pool/trunk/pom.xml )
    ( cd ${project}; mvn test )

    ( cd ${project}; svn up -r 1622300 )   
    ( cd ${project}; mvn test )
    
    ( cd ${project}; svn up -r 1621300 )    
    ( cd ${project}; mvn test )    
}
# Step 1 of the homework.
    ( cd ${home}; wget http://mir.cs.illinois.edu/gliga/projects/ekstazi/release/org.ekstazi.core-3.5.0.jar )
    ( cd ${home}; wget http://mir.cs.illinois.edu/gliga/projects/ekstazi/release/ekstazi-maven-plugin-3.5.0.jar )
    ( cd ${home};  mvn install:install-file -Dfile=org.ekstazi.core-3.5.0.jar -DgroupId=org.ekstazi -DartifactId=org.ekstazi.core -Dversion=3.5.0 -Dpackaging=jar -DlocalRepositoryPath=$HOME/.m2/repository/ )
    ( cd ${home}; mvn install:install-file -Dfile=ekstazi-maven-plugin-3.5.0.jar -DgroupId=org.ekstazi -DartifactId=ekstazi-maven-plugin -Dversion=3.5.0 -Dpackaging=jar -DlocalRepositoryPath=$HOME/.m2/repository/ )
    hw | tee step3.txt
    sed -i 's/.*'"${cwd//\//\\/}"'/USER/g' step3.txt    
