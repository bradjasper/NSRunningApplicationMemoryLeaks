#!/bin/bash

## Script to open and close applications over and over again in a loop

apps=(
    "/Applications/Font Book.app"
    "/Applications/Notes.app"
    "/Applications/Mail.app"
    "/Applications/Preview.app"
    "/Applications/System Preferences.app"
    "/Applications/TextEdit.app"
    "/Applications/Image Capture.app"
    "/Applications/Maps.app"
    "/Applications/Contacts.app"
    "/Applications/Calculator.app"
    "/Applications/Reminders.app"
    "/Applications/Utilities/Console.app"
    "/Applications/Utilities/Disk Utility.app"
    "/Applications/Utilities/Bluetooth File Exchange.app"
    "/Applications/Utilities/Grab.app"
    "/Applications/Utilities/Audio MIDI Setup.app"
    "/Applications/Utilities/Grapher.app"
    "/Applications/Utilities/Script Editor.app"
    "/Applications/Utilities/System Information.app"
    "/Applications/Utilities/Digital Color Meter.app"
)

counter=0

open_apps() {
    echo "Opening apps: $counter"
    for app in "${apps[@]}"
    do
        open "$app"
    done
}

close_apps() {
    echo "Closing apps: $counter"
    for app in "${apps[@]}"
    do
        ps aux | grep "$app" | grep -v grep | awk '{print $2}' | xargs kill -9
    done
}

echo "Starting open/close applications loop"
for app in "${apps[@]}"
do
    echo "Performing on $app"
done

while true
do
    counter=$[$counter+1]
    open_apps
    sleep 2
    close_apps
    sleep 2
done
