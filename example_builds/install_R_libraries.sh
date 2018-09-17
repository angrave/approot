#!/bin/bash

set -e

#R -e 'install.packages("rjags",repos="http://cran.us.r-project.org")'
#R -e 'install.packages("runjags",repos="http://cran.us.r-project.org")'

# https://github.com/stan-dev/rstan/wiki/Installing-RStan-on-Mac-or-Linux
R -e 'install.packages("rstan",repos="http://cran.us.r-project.org")'

