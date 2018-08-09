#!/bin/bash
mute=${1:0}
showNotification=${2:0}

pacmd list-cards | grep alsa_input | sed "s/.*#//g" | sed "s/:.*//g" > /tmp/mute
results=$(cat /tmp/mute)
rm -f /tmp/mute
for id in $results; do
  pactl set-source-mute $id $mute
done

if [ "$showNotification" = "1" ]; then
  muteString=Unmuted
  if [ "$mute" = "1" ]; then 
    muteString=Muted
  fi
  notify-send --hint=string:x-canonical-private-synchronous: $muteString
fi
