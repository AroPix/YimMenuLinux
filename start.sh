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


# If Environment variable SKIP_DOWNLOAD is 1, downloading will be skipped
if [ "$SKIP_DOWNLOAD" == 1 ]; then
    echo "SKIP_DOWNLOAD is set to 1, skipping download!"
else
    curl -L -o "$filename" "$url"
    echo "Downloaded $filename from $url"
fi

# Check if GAME_TYPE environment variable is set
if [ "$GAME_TYPE" == "proton" ]; then
    proton
    exit 0
elif [ "$GAME_TYPE" == "wine" ]; then
    wine
    exit 0
fi

# Selector logic if GAME_TYPE is not set
echo "Please select the game type:"
echo "1. Proton (Steam)"
echo "2. Wine (Rockstar Games, Epic Games"
read -p "Enter your choice (1 or 2): " choice

case $choice in
    1)
        proton
        ;;
    2)
        wine
        ;;
    *)
        echo "Invalid choice. Please run the script again and select 1 or 2."
        exit 1
        ;;
esac

