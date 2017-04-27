#!/bin/bash
#
# Gather the estimated kappas resulting from simulate_estimate.sh
# ######################################################################
#
# USAGE:   ./gather_kas.sh topdir
#
# INPUT:   topdir - the name of the top directory containing the
#                   estimated kappas
#
# OUTPUT:  a file 'kas' in each directory of the tree, containing one
#          text column with all the estimated kappas

# Command line arguments
topdir=$1

# Traverse directory tree
cd $topdir
for zeta in $( ls ); do
    cd $zeta
    for kappa in $( ls ); do
        cd $kappa
        cat ka* > kas
        cd ..
    done
    cd ..
done
cd ..
