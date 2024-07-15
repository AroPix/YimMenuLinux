#!/bin/bash

proton() {
    echo "Proton logic!"
}

wine() {
    echo "Wine logic!"
}


# URL of the DLL
url="https://github.com/YimMenu/YimMenu/releases/download/nightly/YimMenu.dll"

# Filename to save as
filename="YimMenu.dll"

# Download the file, overwriting if it exists
curl -L -o "$filename" "$url"

echo "Downloaded $filename from $url"
