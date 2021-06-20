#!/bin/sh
echo "updating config"
sed -i -r "s/ICECAST_NAME/${ICECAST_NAME}/g" /etc/mpd.conf 
sed -i -r "s/ICECAST_SERVER/${ICECAST_SERVER}/g" /etc/mpd.conf 
sed -i -r "s/ICECAST_PORT/${ICECAST_PORT}/g" /etc/mpd.conf 
sed -i -r "s/ICECAST_PASSWORD/${ICECAST_PASSWORD}/g" /etc/mpd.conf 
sed -i -r "s#ICECAST_MOUNT#${ICECAST_MOUNT}#g" /etc/mpd.conf 

# initialize if needed
mkdir -p /mpd
touch /mpd/database

echo "starting mpd"
mpd

echo "updating database"
mpc update --wait

echo "updating playlist"
mpc clear
mpc ls | mpc add

echo "playing"
mpc random on
mpc play

echo "watching log..."
tail -f /var/log/mpd.log
