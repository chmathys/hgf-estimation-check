# hgf-estimation-check
Check whether HGF parameter estimation works using simulations where the ground truth is known

## Purpose
This is to replicate Figure 7 of [Mathys et al. (2014)](https://dx.doi.org/10.3389/fnhum.2014.00825) for the BFGS algorithm as implemented in the [HGF Toolbox](https://tnu.ethz.ch/tapas). The priors used are close to those in that paper, however some differences remain:

- _omega_ is now _omega\_2_
- _kappa_ is now _kappa\_2_ and is estimated in log-space instead of logit-space
- _theta_ is now exp(_omega\_3_), which is estimated in log-space

## Platform
This is intended to run on ETH's Euler cluster. However, with a few straightforward modifications to `simulate_estimate.sh`, it can be run on any platform that has Bash and Matlab.

## Usage
Entering

```
$ ./simulate_estimate.sh sims 256
```

at the shell prompt will give you 256 estimations per cell of your _zeta_/_kappa_ grid, structured in a directory tree under the top-level directory `sims`. The first level of the tree contains directories named by _zeta_ value, the second level by _kappa_ value. The files containing the estimated _kappa_ value are called `ka{1..256}`. A log file for each _kappa_'s job is provided in `job{1..256}.log`. For example, to get all estimated kappas for ground truth _zeta_=6 and _kappa_=2.5, you can run

```
$ kas < cat sims/6/2.5/ka*
```

