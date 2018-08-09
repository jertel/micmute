#!/bin/bash
mute=${1:0}
showNotification=${2:0}

pa=pactl
if [ "$mute" = "1" ]; then 
  muteString=Muted
fi
if [ "$mute" = "0" ]; then 
  muteString=Unmuted
fi

pacmd list-cards | grep alsa_input | sed "s/.*#//g" | sed "s/:.*//g" > /tmp/mute
results=$(cat /tmp/mute)
rm -f /tmp/mute
for id in $results; do
  $pa set-source-mute $id $mute
done

if [ "$showNotification" = "1" ]; then
  notify-send --hint=string:x-canonical-private-synchronous: $muteString
fi
