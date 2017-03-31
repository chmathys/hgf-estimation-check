#!/bin/bash
#
# Simulate HGF trajectories with noisy binary output, then try to
# recover the parameters used in the simulation.
# ######################################################################
#
# The intention behind this is to get something similar to Figure 7 in
# Mathys et al. (2014).
#
# This is a shell script for easy portability to a cluster where all
# Matlab calls can be handled in parallel.
# ######################################################################
#
# USAGE:   ./simulate_estimate.sh topdir n
#
# INPUT:   topdir - the name of the top directory containing the
#                   estimated kappas
#
#          n      - the number of simulation-estimation runs per
#                   cell of the parameter grid
#
# OUTPUT:  directory structure containng the estimated kappas

# Command line arguments
topdir=$1
n=$2

# Create a directory structure where the estimated kappas will be
# stored. At the first level, we have the value of zeta, at the
# next deeper level, we have the value of kappa.
mkdir -p $topdir/{0.5,1,6,24}/{0.5,1,1.5,2,2.5,3,3.5}

# Load Matlab module
module load matlab

# Traverse directory tree
cd $topdir
for zeta in $( ls ); do
    cd $zeta
    for kappa in $( ls ); do
        cd $kappa
        for (( i=1; i<=$n; i++ )); do
            bsub -W 20 -o job$i.log matlab -nojvm -nodisplay -nosplash -r "cd ../../..; simulate_estimate('$topdir', $zeta, $kappa, $i); quit();"
        done
        cd ..
    done
    cd ..
done
cd ..
