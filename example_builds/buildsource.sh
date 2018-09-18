#/bin/bash
# buildsource.sh

set -e

approot_require_env() {
if [ ! -d "${APPROOT}" ] ; then
  >&2 echo "APPROOT must point to a valid directory. Use approot_init then approot_activate"
  return 1
fi
if [ ! "$APPROOT_BUILD" ] ; then
  >&2 echo "APPROOT_BUILD must be set. Use approot_init then approot_activate"
  return 1
fi
return 0
}

approot_require_env || exit 1

URL_BASE="$1"
NAME="$2"
VERSION="$3"

if [ ! $VERSION ] ; then
>&2 echo "Usage: $0 <url> <name> <version>"
>&2 echo "  e.g. $0 https://ftp.gnu.org/gnu/ncurses ncurses 6.1"
exit 1
fi
shift; shift; shift; CONFIG_EXTRAS="$*"

echo "Building $NAME $VERSION at $USERPKG_BUILD"

cd "${APPROOT_BUILD}"

VERSION_NAME="${NAME}-${VERSION}"
URL="${URL_BASE}/${VERSION_NAME}.tar.gz"

if [ ! -d "${VERSION_NAME}" ] ; then
wget --no-clobber "${URL}"
tar xzf ${VERSION_NAME}.tar.gz
fi

cd "${VERSION_NAME}"

#Even though LIBDIR is set as an environment variable and is
# specified in config.site, we still need to specify it here

./configure --prefix="${APPROOT}" --config-cache --libdir="${LIBDIR}" ${CONFIG_EXTRAS}
make
make install
echo "Finished $VERSION_NAME"
