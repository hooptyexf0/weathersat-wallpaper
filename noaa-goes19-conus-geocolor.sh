#! /bin/bash


#plasma dbus stuff

export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
export DISPLAY=":0"
export LC_TIME=C
export LC_NUMERIC=C


#make dir if needed, check web access then noaa site, check existance of latest and create if needed

mkdir -p ~/Pictures/NOAA_GOES19_CONUS/history

ping -c 1 -w 1 1.1.1.1

if wget -q --spider http://cdn.star.nesdis.noaa.gov/GOES19/ABI/CONUS/GEOCOLOR/; then

    if [ ! -f ~/Pictures/NOAA_GOES19_CONUS/latest.jpg ]; then
        wget -NS -P ~/Pictures/NOAA_GOES19_CONUS/ "https://cdn.star.nesdis.noaa.gov/GOES19/ABI/CONUS/GEOCOLOR/latest.jpg"
    fi


cd ~/Pictures/NOAA_GOES19_CONUS/

 #move latest to history in order to set buffer wallpaper
 mv ~/Pictures/NOAA_GOES19_CONUS/latest.jpg ~/Pictures/NOAA_GOES19_CONUS/history/latest.jpg

 #set buffer wallpaper
 /usr/bin/plasma-apply-wallpaperimage -f stretch ~/Pictures/NOAA_GOES19_CONUS/history/latest.jpg

 #get new latest and set new
 wget -NS -P ~/Pictures/NOAA_GOES19_CONUS/ "https://cdn.star.nesdis.noaa.gov/GOES19/ABI/CONUS/GEOCOLOR/latest.jpg"

 sleep 5

 /usr/bin/plasma-apply-wallpaperimage -f stretch ~/Pictures/NOAA_GOES19_CONUS/latest.jpg

 #rename old latest to timestamp (not sure why using move but w/e)
 mv ~/Pictures/NOAA_GOES19_CONUS/history/latest.jpg ~/Pictures/NOAA_GOES19_CONUS/history/latest$(date +"%Y-%m-%d_%H-%M").jpg

fi

#clean up history

copiesToKeep=48
files=( ~/Pictures/NOAA_GOES19_CONUS/history/* )
delcnt=$(( ${#files[@]} - copiesToKeep ))
[ $delcnt -gt 0 ] &&
rm -f "${files[@]:0:delcnt}"

sleep 5

exit
