# micmute
Toggle the microphone mute via PulseAudio

# Usage
Execute in a terminal window.
```
./togglemute.sh [muteOnOff] [showNotification]

Where
  muteOnOff          0 to unmute, or 1 to mute; defaults to 0
  showNotifications  0 to not show notifications, or 1 to show a desktop notification; defaults to 0
```

Example:
```
./togglemute.sh 0 1
```
Will mute the microphone and popup a small, temporary notification that indicates the microphone is now muted.
