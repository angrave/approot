# approot
Build and install standard Linux applications and library without sudo

# License and Warranty

See the LICENSE file that is included with this project

# Warning

This project is considered EXPERIMENTAL and ALPHA
Bugs, errors, unexpected constraints are expected.
Use at your own risk. See the LICENSE file for more information

# Installation

cd
git clone https://github.com/angrave/approot

printf "\n. ${HOME}/approot/approot_functions\n" >> ~/.profile

To use approot immediately either start a new shell or source the functions-
. approot/approot_functions  (that lonely dot is important)

Then create a directory well applications will be installed
mkdir ~/localapps
approot_init ~/localapps

To use 
approot_activate ~/localapps

This will set $APPROOT, $PATH, LIBDIR and a whole load of other environment variables. You will likely want to always use this directory so you can set it as the default application root

printf "\n. approot_activate ${HOME}/localapps\n" >> ~/.profile 

To stop using a directory either approot_activate another directory or use
approot_deactivate

The latter will unset a whole load of environment variables and reset $PATH

You can configure your approot using 
${APPROOT}/share/

For example you can use parallel make or download packages to the /tmp

