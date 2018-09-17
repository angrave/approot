#!/bin/bash
set -e
approot_build https://ftp.gnu.org/gnu/ncurses ncurses 6.1 
approot_build https://ftp.gnu.org/gnu/readline readline 7.0 
approot_build https://curl.haxx.se/download curl 7.61.1


