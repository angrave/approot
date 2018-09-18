# approot
Build and install standard Linux applications and library without sudo

# License and Warranty

See the LICENSE file that is included with this project

# Warning

This project is considered EXPERIMENTAL and ALPHA
Bugs, errors, unexpected constraints are expected.
Use at your own risk. See the LICENSE file for more information

# Installation
```bash
cd
git clone https://github.com/angrave/approot

printf "\n. ${HOME}/approot/approot_functions\n" >> ~/.bashrc
```
To use approot immediately either start a new shell or source the functions-
```bash
. approot/approot_functions  (that lonely dot is important)
```

Then create a directory well applications will be installed
```bash
mkdir ~/localapps
approot_init ~/localapps
```
To use 
```bash
approot_activate ~/localapps
```
This will set `$APPROOT`, `$PATH`, `LIBDIR` and a whole load of other environment variables. Most users will always want to always use this directory, so you may want to set it as the default application root in your .bashrc file
```bash
printf "\n. approot_activate ${HOME}/localapps\n" >> ~/.bashrc 
```
To stop using a directory either `approot_activate another-directory` or use
```bash
approot_deactivate
```

The latter will unset a whole load of environment variables and remove the current `$APPROOT_PATH` from your `$PATH`

You can configure your approot using 
```bash
${APPROOT}/share/approot_activate_custom #Extra commands to run when activating the application root
${APPROOT}/share/approot_activate_custom #Extra commands to run when deactivating the current application root
```
For example you can use parallel make or download packages to the /tmp

