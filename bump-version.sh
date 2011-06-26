#!/bin/sh

#
# Derived from gitflow "bump-version" script in order to stay compatible.
#


usage() {
	echo "usage: $0 <version-id>"
}

if [ $# -ne 1 ]; then
	usage
	exit 1
fi

if ! sed 's/^GITFLOW_VERSION=.*$/GITFLOW_VERSION='$1'/g' git-flow-version > .git-flow-version.new; then
	echo "Could not replace GITFLOW_VERSION variable." >&2
	exit 2
fi

mv .git-flow-version.new git-flow-version

# Also offer a non-git-flow-specific file name
ln -s -f git-flow-version VERSION.txt 

# Deactivated these in order to be "less magical" and force the user to be more explicit in the beginning.
#git add git-flow-version
#git commit -m "Bumped version number to $1" git-flow-version
