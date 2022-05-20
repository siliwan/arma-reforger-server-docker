#!/bin/sh
echo "[System] Installing/Updating"
steamcmd +force_install_dir /home/container +login anonymous +app_update 1874900 +quit
echo "[System] Installation/Update finished"

chown -R container /home/container


MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}