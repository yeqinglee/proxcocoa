#!/bin/bash

#--driver-java-options "-XX:+UseG1GC -Xss8m" \

spark-submit \
--master yarn-cluster \
--class "l1distopt.driver" \
--driver-memory 7G \
--driver-class-path target/scala-2.10/proxcocoa-assembly-0.1.jar \
target/scala-2.10/proxcocoa-assembly-0.1.jar \
"$@"
