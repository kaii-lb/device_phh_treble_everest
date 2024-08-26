#!/bin/sh

echo "PHH-EVEREST: Launched EverestOS on boot service"

headsup="$(getprop persist.sys.phh.everest_annoying_notis)"
if [[ $headsup == "true" ]]; then
       echo "PHH-EVEREST: enabling annoying notifications..."
       settings put system notification_sound_vib_screen_on 0
       settings put system notification_sound_vib_screen_on 1
fi
