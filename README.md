# YimMenu start script

!!! This needs to be done BEFORE launching the game. !!!
Using alt:V will result in the ASILoader DLL getting replaced.
With this script I intend to automate the downloading and updating of ASILoader and YimMenu

This script intends to work for Proton (Steam) and Wine (Rockstar Games, Epic Games) installations

# Paths
The script checks for the standard Steam and Lutris path at the moment
If you want to override this, set the environment variable WINE_GTA_PATH to the path of the game and select Wine as option or start with GAME_TYPE=wine (Yes, even if your path differs!)


# Env Variables

| ENV Variable      | Description                                                  | Example              |
|-------------------|--------------------------------------------------------------|----------------------|
| WINE_GTA_PATH     | The path to the game folder, containing the games executable | ./Grand Theft Auto V |
| GAME_TYPE         | Sets the type for the type of game installation              | "wine" or "proton"   |
| LAUNCH_STEAM      | Launches the game after running the script                   | 1 for yes            |
| SKIP_DOWNLOAD_YIM | Skips the download from Github                               | 1 for skip           |
| SKIP_DOWNLOAD_ASI | Skips the download from Github                               | 1 for skip           |

## A good example for Steam would be:
`GAME_TYPE=proton LAUNCH_STEAM=1 ./start.sh`
This way you don't have to give any input and the game will just launch!