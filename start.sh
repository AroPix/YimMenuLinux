#!/bin/bash

proton() {
    winePath="$HOME/.local/share/Steam/steamapps/common/Grand Theft Auto V/"
    install
}

wine() {
    # Check if WINE_GTA_PATH environment variable is set
    if [ -z "$WINE_GTA_PATH" ]; then
        winePath="$HOME/Games/grand-theft-auto-v/drive_c/Program Files (x86)/Grand Theft Auto V/"
        echo "WINE_GTA_PATH is not set, using standard Lutris path $winePath"
    else
        winePath="$WINE_GTA_PATH"
    fi
    install
}

download_yim() {
  curl -L -o "$yimDLL" "$url_yim"
  echo "Downloaded $yimDLL from $url_yim"
}

download_asi() {
  curl -L -o "${asiLoader}.zip" "$url_asi"
  echo "Downloaded ${asiLoader}.zip from $url_asi"
  unzip -o "${asiLoader}.zip" "${asiLoader}.dll"
}

install() {
    if [ ! -d "$winePath" ]; then
        echo "Game folder doesn't exist!!!"
        exit 0
    fi

  if [ ! -f "${winePath}/${asiLoader}Hooked.dll" ]; then
      cp "${winePath}/${asiLoader}.dll" "./${asiLoader}.Backup.dll"
      mv "${winePath}/${asiLoader}.dll" "${winePath}/${asiLoader}Hooked.dll"
      echo "Hooked.dll not found, renaming $asiLoader"
  fi

  mv "$asiLoader.dll" "$winePath"
  if [ ! -d "$winePath/scripts" ]; then
      mkdir -p "$winePath/scripts"
      echo "The folder $winePath/scripts did not exist and has been created."
  fi
  mv $yimDLL "$winePath/scripts"

  echo "Everything is set!"
  if [ "$gameType" == "proton" ]; then
    launch_steam
  fi
}

launch_steam() {
  if [ "$LAUNCH_STEAM" == 1 ]; then
    steam steam://rungameid/271590
  elif [ "$LAUNCH_STEAM" == 0 ]; then
    exit 1
  else
    read -p "Do you want to launch the game on Steam now? (y/n): " choice

    case $choice in
        y)
            steam steam://rungameid/271590 &
            exit 1
            ;;
        *)
            echo "Exiting..."
            exit 1
            ;;
    esac
  fi
}


# URL of Yim
url_yim="https://github.com/YimMenu/YimMenu/releases/download/nightly/YimMenu.dll"

# URL of ASI Loader
url_asi="https://github.com/ThirteenAG/Ultimate-ASI-Loader/releases/download/x64-latest/bink2w64-x64.zip"

# Filename to save as
yimDLL="YimMenu.asi"

# ASILoader file name
asiLoader="bink2w64"

# ENV var GAME_TYPE "proton" or "wine"
gameType=$GAME_TYPE


# If Environment variable SKIP_DOWNLOAD_YIM is 1, yim downloading will be skipped if file exists
if [ "$SKIP_DOWNLOAD_YIM" == 1 ]; then
    if [ -f "$yimDLL" ]; then
        echo "SKIP_DOWNLOAD_YIM is set to 1, skipping download!"
    else
        echo "SKIP_DOWNLOAD_YIM is set to 1, but file doesn't exist so it will be downloaded anyway!"
        download_yim
    fi
else
    download_yim
fi

# If Environment variable SKIP_DOWNLOAD_ASI is 1, yim downloading will be skipped if file exists
if [ "$SKIP_DOWNLOAD_ASI" == 1 ]; then
    if [ -f "$asiLoader.zip" ]; then
        echo "SKIP_DOWNLOAD_ASI is set to 1, skipping download!"
    else
        echo "SKIP_DOWNLOAD_ASI is set to 1, but file doesn't exist so it will be downloaded anyway!"
        download_asi
    fi
else
    download_asi
fi


# Check if GAME_TYPE environment variable is set
if [ "$gameType" == "proton" ]; then
    proton
    exit 0
elif [ "$gameType" == "wine" ]; then
    wine
    exit 0
fi

# Selector logic if GAME_TYPE is not set
echo "Please select the game type:"
echo "1. Proton (Steam)"
echo "2. Wine (Rockstar Games, Epic Games)"
read -p "Enter your choice (1 or 2): " choice

case $choice in
    1)
        gameType="proton"
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

