#!/bin/bash
BASEDIR=`php -r "echo dirname(realpath('$0'));"`
OLDDIR=`pwd`
cd $BASEDIR

# Result of last tried operation, also used as flag for skipping subsequent steps.
LAST_RETURN_VALUE=0

# step 1
if [ $LAST_RETURN_VALUE -eq 0 ]; then
  # As drush make doesn't support single file injection into already existing directories, we do it here.
#  curl http://gmaps-utility-library-dev.googlecode.com/svn/tags/markerclusterer/1.0/src/markerclusterer_packed.js > modules/contrib/gmap/thirdparty/markerclusterer_packed.js
#  LAST_RETURN_VALUE=$?
  if [ $LAST_RETURN_VALUE -ne 0 ]; then
    echo "There was a problem with curl."
  fi
fi

# step 2
if [ $LAST_RETURN_VALUE -eq 0 ]; then
  # As drush make doesn't support local patch files, we do it here.
  for PATCHNAME in `ls $BASEDIR/patches/*.patch 2> /dev/null`;
  do
    PROJECTNAME=`basename $PATCHNAME .patch`
    cd $BASEDIR/modules/contrib/$PROJECTNAME
    echo now patching project $PROJECTNAME:
    patch -p0 < $BASEDIR/patches/$PROJECTNAME.patch
    LAST_RETURN_VALUE=$?
    if [ $LAST_RETURN_VALUE -ne 0 ]; then
      echo "There was a problem with the local patch for project $PROJECTNAME"
      # break, so that subsequent loop runs won't overwrite our LAST_RETURN_VALUE "flag"
      break
    fi
  done
  cd $BASEDIR
fi

# Go back where we came from. Unconditionally.
cd $OLDDIR

# Feedback for the user and, more important, for the calling script (most likely rebuild.sh)
if [ $LAST_RETURN_VALUE -eq 0 ]; then
  echo "Everything was fine in $0"
  exit 0
else
  echo "There were problems in $0"
  exit 1
fi

