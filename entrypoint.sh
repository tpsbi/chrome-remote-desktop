#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

echo "Creating user with UID : $USER_ID"
useradd -m -s /bin/bash -u $USER_ID -o -G chrome-remote-desktop user
export HOME=/home/user

/usr/sbin/service chrome-remote-desktop start

exec /usr/sbin/gosu user "$@"
