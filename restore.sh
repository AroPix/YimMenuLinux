#!/bin/bash

# ASILoader file name
asiLoader="bink2w64"

# Check if WINE_GTA_PATH environment variable is set
if [ -z "$WINE_GTA_PATH" ]; then
    winePath="$HOME/.local/share/Steam/steamapps/common/Grand Theft Auto V/"
    echo "WINE_GTA_PATH is not set, using standard Steam path $winePath"
else
    winePath="$WINE_GTA_PATH"
fi

if [ -f "${winePath}/${asiLoader}Hooked.dll" ]; then
    mv "${winePath}/${asiLoader}Hooked.dll" "${winePath}/${asiLoader}.dll"
    echo "Hooked.dll reverted, renamed to ${asiLoader}.dll"
fi

