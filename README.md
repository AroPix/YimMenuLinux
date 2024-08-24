# YimMenu start script

> [!WARNING]  
> This script works for me, but in theory it is really dumb. Don't use it if you don't understand it

alt:V doesn't work when ASILoader is installed to the game path. I made this script to solve this problem.

With this script I intend to automate the downloading and updating of ASILoader and YimMenu

This script intends to work for Proton (Steam) and Wine (Rockstar Games, Epic Games) installations (Because i use both)

# Paths
The script checks for the standard Steam and Lutris path at the moment
If you want to override this, set the environment variable WINE_GTA_PATH to the path of the game and select Wine as option or start with GAME_TYPE=wine (Yes, even if your game is Steam and the path differs!)


# Env Variables

| ENV Variable      | Description                                                  | Example                                            |
|-------------------|--------------------------------------------------------------|----------------------------------------------------|
| WINE_GTA_PATH     | The path to the game folder, containing the games executable | ./Grand Theft Auto V                               |
| GAME_TYPE         | Sets the type for the type of game installation              | "wine" or "proton"                                 |
| LAUNCH_STEAM      | Launches the game after running the script                   | 1 for yes                                          |
| SKIP_DOWNLOAD_YIM | Skips the download from Github                               | 1 for skip                                         |
| SKIP_DOWNLOAD_ASI | Skips the download from Github                               | 1 for skip                                         |
| UPDATE_MENUS      | Downloads Extras Menu and Ultimate Menu                      | 1 to Update else scripts get removed (to be fixed) |

## A good example for Steam would be:
`GAME_TYPE=proton LAUNCH_STEAM=1 ./start.sh`
This way you don't have to give any input and the game will just launch!

# Installation

Clone with git:
`git clone https://github.com/AroPix/YimMenuLinux.git ~/Games/yimmenu/`

# alt:V
Open altv.sh, and add

`$HOME/Games/yimmenu/restore.sh`

before the Steam launch command and

`LAUNCH_STEAM=0 GAME_TYPE=proton $HOME/Games/yimmenu/start.sh`

after