#/bin/bash
# buildsource.sh

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

[ approot_require_env ] || exit 1

URL_BASE="$1"
NAME="$2"
VERSION="$3"
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
./configure --prefix="${APPROOT}" ${CONFIG_EXTRAS}
make install
