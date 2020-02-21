#!/bin/bash

rm plot.dat

JOB=$1

ITER=0
writedata() {
    if [ -n $(bbjobs -l $JOB | grep -m 1 -e "Resident" | grep -Eo '[0-9]+[.][0-9]') ]; then
	echo "Job "$JOB" is running. Collecting data..."
    else
	echo "Job not running. Starting to write when job starts"
    fi
    while [ -n $(bbjobs -l $JOB | grep -m 1 -e "Resident" | grep -Eo '[0-9]+[.][0-9]') ]; do 
	NUM=$(bbjobs -l $JOB | grep -m 1 -e "Resident" | grep -Eo '[0-9]+[.][0-9]')
	echo -e ${ITER}'\t'${NUM} >> plot.dat
	sleep 10
	ITER=$(($ITER+1))
    done
}

writedata
