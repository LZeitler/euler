#!/bin/bash

# find out what your job writes to stdout and stderr while it runs non-interactively
# syntax: find_out.sh <JOB-ID> <out or err>

spdir=$(bparams -a | grep 'JOB_SPOOL_DIR = ' | cut -c25-)
less $(find $spdir/*$1*$2)
