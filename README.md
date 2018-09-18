# approot
Build, install and run standard Linux applications and libraries as a non-admin user. `sudo make install` _not_ required.

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

Then create a directory where applications will be installed
```bash
mkdir ~/localapps
approot_init ~/localapps
```
To use 
```bash
approot_activate ~/localapps
```
This will set `$APPROOT`, `$PATH`, `LIBDIR` and a whole load of other environment variables. Most users will always want to always use this directory for all their applications, so you can set it as the default application root in your .bashrc file
```bash
printf "\n. approot_activate ${HOME}/localapps\n" >> ~/.bashrc 
```
To stop using a directory either `approot_activate another-directory` or use
```bash
approot_deactivate
```

The latter will unset a whole load of environment variables and remove the current `$APPROOT_PATH` from your `$PATH`

## Advanced: Customizing an approot environment
You can customize your approot environment by adding commands to the following files
```bash
#Extra commands to run when activating the application root -
${APPROOT}/share/approot_activate_custom 
#Extra commands to run when deactivating the current application root
${APPROOT}/share/approot_deactivate_custom 
```
For example, we can set make to compile in parallel or configure the download directory to be inside /tmp
```bash
#approot_activate_custom

export APPROOT_BUILD="/tmp/${USER}_appbuild"
mkdir -p -m700 "${APPROOT_BUILD}" 2>/dev/null
export MAKEFLAGS="-j4"
```

# Building Applications

See the example scripts inside the `example_builds/` directory

```bash
# We will the buildsource.sh script to download, compile and install a standard linux application
# buildsource.sh assumes the project has a  ./configure step.

cd ~/approot/example_builds/

# Or whatever directory you like to install your packages in
approot_activate ~/local

./buildsource.sh https://cloud.r-project.org/src/base/R-3 R 3.5.1 --without-man --with-readline=no
R -e 'install.packages("rstan",repos="http://cran.us.r-project.org")'

If I wanted readline and curl support -
./buildsource.sh https://ftp.gnu.org/gnu/ncurses ncurses 6.1 --without-man
./buildsource.sh https://ftp.gnu.org/gnu/readline readline 7.0 --without-man
./buildsource.sh https://curl.haxx.se/download curl 7.61.1 --without-man
```
# Use the source!

This project is big in utility but small in size. To find out more please read the source! 
For example `approot_init` `approot_activate` are just shell functions defined inside `approot_functions`
