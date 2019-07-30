#!/bin/bash

# submit with the following command
# bsub -J "testscr[1-16]" './scripts/testsc.sh $LSB_JOBINDEX'

echo 'Array '$1
popmask=$HOME/pro/300_analyses/annotations/popmask/
popfile=$(find $popmask -type f | head -$1 | tail -1)
pop=$(basename --suffix='.txt' $popfile)
echo 'Array '$1' running '$pop
