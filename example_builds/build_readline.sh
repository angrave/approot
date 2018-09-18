#!/bin/bash
#set -e

buildsource.sh https://ftp.gnu.org/gnu/ncurses ncurses 6.1 --without-man
buildsource.sh https://ftp.gnu.org/gnu/readline readline 7.0 --without-man
buildsource.sh https://curl.haxx.se/download curl 7.61.1 --without-man


