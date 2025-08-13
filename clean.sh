#!/bin/bash 

ls -l $SERVER
ls -l /home/tf2/hlserver/tf2
cd $SERVER/tf2/tf/maps

rm -f *.bsp || true

# We only store cp_process_f12
MATCHA_DL_URL="https://fastdl.avanlcy.hk"
SERVEME_DL_URL="https://fastdl.serveme.tf"

if ! wget -nv -P "$SERVER/tf2/tf/maps" "${MATCHA_DL_URL}/maps/cp_process_f12.bsp"; then
    echo "cp_process_f12 not found on ${MATCHA_DL_URL}, trying ${SERVEME_DL_URL}..."
    if ! wget -nv -P "$SERVER/tf2/tf/maps" "${SERVEME_DL_URL}/maps/cp_process_f12.bsp"; then
        echo "Failed to download cp_process_f12."
        exit 1
    fi
fi

cd $SERVER/tf2/tf

rm -f resource/tf_*.txt || true