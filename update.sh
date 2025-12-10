#!/bin/sh
set -e
cd $HOME/hlserver

# Credits:
# https://github.com/melkortf/tf2-servers/blob/master/packages/tf2-base/install_tf2.sh

max_retries=3
retry_count=0

while [ $retry_count -lt $max_retries ]; do
  if /usr/games/steamcmd +runscript "$HOME/hlserver/tf2_ds.txt"; then
    exit 0
  fi
  
  retry_count=$((retry_count + 1))
  if [ $retry_count -lt $max_retries ]; then
    echo "Steamcmd failed. Retrying ($retry_count/$max_retries)..."
    sleep 5
  fi
done

echo "Failed to install TF2 after $max_retries attempts"
exit 1