#!/usr/bin/env bash 
echo "Go"

mountable=$(lsblk -lp | grep "part $" | awk '{print $1 " (" $4 ")"}')
[[ "$mountable" = "" ]] && exit 1
chosen=$(echo "$mountable" | dmenu -i -p "Mount which drive?" | awk '{print $1}')
[[ "$chosen" = "" ]] && exit 1
sudo mount $chosen && exit 0
dirs=$(find /mnt /media /mount /home -type d -maxdepth 3 2>/dev/null)
mountpoint=$(echo "$dirs" | dmenu -i -p "Type in mount point.")
[[ "$mountpoint" = "" ]] && exit 1
if [[ ! -d "$mountpoint" ]]; then
  mkdiryn=$(echo -e "No\nYes" | dmenu -i -p "$mountpoint does not exist. Create it?")
  [[ "$mkdiryn" = Yes ]] && sudo mkdir -p "$mountpoint"
fi
sudo mount $chosen $mountpoint && pgrep -x dunst && notify-send "$chosen mounted to $mountpoint"
