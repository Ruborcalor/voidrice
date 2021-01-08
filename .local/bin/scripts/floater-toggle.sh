#!/bin/sh

if [[ -z $(pgrep -f "st -n floater") ]];
then
  st -n floater &
  sleep 0.2
  i3-msg '[instance=floater]' move scratchpad
fi

i3-msg '[instance=floater]' scratchpad show
