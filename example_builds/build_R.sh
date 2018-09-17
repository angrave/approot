#!/bin/bash
# Assumes approot_functions are sourced in ~/.bashrc

# Optional 4 argument is passed to ./configure
# Example with readline support - 
#approot_build https://cloud.r-project.org/src/base/R-3 R 3.5.1 "--with-readline=no"

# This might build without man page support...
approot_build https://cloud.r-project.org/src/base/R-3 R 3.5.1 " --without-man"
