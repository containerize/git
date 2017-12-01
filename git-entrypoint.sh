#!/bin/sh

trap "echo TRAPed signal" HUP INT QUIT TERM

mkdir -p "$REPO_LOCAL"

git -C "$REPO_LOCAL" pull || git clone "$REPO_REMOTE" "$REPO_LOCAL"


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
