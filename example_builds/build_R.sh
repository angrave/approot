#!/bin/bash

# Optional 4 argument is passed to ./configure
# Example with readline support - 
#buildsource.sh https://cloud.r-project.org/src/base/R-3 R 3.5.1 "--with-readline=no"

# This might build without man page support...
buildsource.sh https://cloud.r-project.org/src/base/R-3 R 3.5.1 --without-man
