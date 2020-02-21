#!/bin/bash

rm plot.dat

JOB=$1

ITER=0
writedata() {
    if $(bbjobs -l $JOB | grep -q "RUNNING"); then 
	echo "Job "$JOB" is running."
    else
	echo "Job "$JOB" not running. Starting to write when job starts"
	while $(bbjobs -l $JOB | grep -q "PENDING"); do
	    sleep 10
	done
    fi
    
    echo "Collecting data now ..." 
    sleep 5

    while $(bbjobs -l $JOB | grep -q "RUNNING"); do 
	NUM=$(bbjobs -l $JOB | grep -m 1 -e "Resident" | grep -Eo '[0-9]+[.][0-9]')
	echo -e ${ITER}'\t'${NUM} >> plot.dat
	sleep 10
	ITER=$(($ITER+1))
    done
}

writedata &
sleep 11
echo "Plotting ..."
gnuplot liveplot.gnu
