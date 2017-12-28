#!/bin/sh

trap "echo TRAPed signal" HUP INT QUIT TERM

mkdir -p "$REPO_LOCAL"
cd "$REPO_LOCAL"

git init
git remote add origin "$REPO_REMOTE"
git fetch
git reset origin/"$REPO_BRANCH"
git reset --hard HEAD

if [ -z "$REPO_COMMIT" ]; then
    echo "you can set REPO_COMMIT to clone specific commit"
else
    echo "reset to commit: $REPO_COMMIT"
    git reset --hard "$REPO_COMMIT"
fi

echo "[hit enter key to exit] or run 'docker stop <container>'"
read

# stop service and clean up here
echo "stopping git"

echo "exited $0"
