# weathersat-wallpaper
Live updating wallpaper from the NOAA weathersat GOES-19, currently set to Continental US, GeoColor3.

Directory hardcoded to ~/Pictures/...
Includes previously added check for initial run, made for half hour runs, keeps rolling 48 images for 24hr timeframe.
Made to be run via Cron job, setup not baked into script yet.

Must be made executable via chmod +x

Only tested on Kubuntu 25.10, KDE Plasma 6 (works in both Wayland and X11)
