# ProxCoCoA+
A primal-dual framework for distributed L1-regularized optimization, running on [Apache Spark](spark.apache.org).

This code trains a standard least squares sparse regression with L1 or elastic net regularizer. The proxCoCoA+ framework runs on the primal optimization problem (called D in [the paper](http://arxiv.org/pdf/1512.04011)). To solve the data-local subproblems on each machine, an arbitrary solver can be used. In this example we use randomized coordinate descent as the local solver, as the L1-regularized single coordinate problems have simple closed-form solutions.

The code can be easily adapted to include other internal solvers or to solve other data-fit objectives or regularizers.

## Getting Started
How to run the code locally:

```
sbt/sbt assembly
./run-demo-local.sh
```

(For the `sbt` script to run, make sure you have downloaded CoCoA into a directory whose path contains no spaces.)

## Run on TACC

### Create reservation
Go to [Wrangler Portal](https://portal.wrangler.tacc.utexas.edu/) and create a hadoop reservation.
Choose "Start as soon as possible?". It will take a few minute for the reservation to realize.
Then, use the following command to find out reservation name
```
showres -a
```

### Load modules
Load the necessary modules:
```
module load spark-paths
module load hadoop-paths
```

### Use hadoop reservation in debug mode

Command
```
idev -r hadoop+MATGENOME+1183 -n 1
```

Note: hadoop+MATGENOME+1183 is reservation name. 
pyspark and spark-shell can only be run on idev mode (with reservation).

### Run the code
Copy data to Hadoop File Syatem.
```
hdfs dfs -copyFromLocal data/ .
```

Run it:
```
sbt/sbt assembly
./run-demo-TACC.sh
```

Or run the shell
```
spark-shell --master yarn-master
```
**Note**: Remember to copy file to hdfs

### Check the results

```
yarn logs -applicationId application_1455766451986_0015
```
where "application_1455766451986_0015" is the application ID.

## References
The algorithmic framework is described in more detail in the following paper:

_Smith, V., Forte, S., Jordan, M.I., Jaggi, M. [L1-Regularized Distributed Optimization: A Communication-Efficient Primal-Dual Framework](http://arxiv.org/abs/1512.04011)_
