# weathersat-wallpaper
Live updating wallpaper from the NOAA weathersat GOES-19, currently set to Continental US, GeoColor3.

NOTES:

Relies on NOAA consistantly uploading a new image every 5 min to the same index and having a copy of the most recent called "latest.jpg".

Directory hardcoded to ~/Pictures/...

Includes previously added check for initial run, made for half hour runs, keeps rolling 48 images for a 24hr history.
Made to be run via Cron job, setup not baked into script yet.

Must be made executable via chmod +x

Only tested on Kubuntu 25.10, KDE Plasma 6 (works in both Wayland and X11)
