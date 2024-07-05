# finkchutil

A handful of system utility functions for the fantasy workstation Picotron. These functions focus on integrating external editors into the Picotron workflow.

## instilation

To install this library, copy the `.lua` files from `src` into your Picotron's `util` folder (`/appdata/system/util`). If the `util` directory does not exist, make one at the location.  
To install the startup script, copy `startup.lua` from the `startup` directory to your Picotron's `system` folder (`appdata/system`).  
To install the logging function, copy the logging function file (from `finkchutil/logger/log.lua`) into Picotron's system folder (`/appdata/system`).  

Alternatively, you can store the files on your host OS and mount the directory to its respective location on Picotron. To do so, edit your Picotron's `config` file (see [Picotron User Manual](https://www.lexaloffle.com/dl/docs/picotron_manual.html) for where to find the config file). You may mount the directory containing the files or the files themselves.


## dump

`dump` copies the current cartridge in RAM to the specified folder. If no folder is specified, it creates a folder called "dump".  
Warning: this command deletes preexisting contents of the specified folder.


## close

`close` closes all active tabs, those being all process instances of `code.p64`, `gfx.p64`, `map.p64`, and `sfx.p64`.


## bind

`bind` is similar to `mount` where it mounts an origin directory to a target location. Unlike `mount`, `bind` will delete any preexisting directory at the target location. Also unlike `mount`, if only one argument is specified then the argument is the origin and the target is `/ram/cart`.


## revive

`revive` opens the target's primary working tabs, those being the `main.lua`, `gfx/0.gfx`, `map/0.map`, and `sfx/0.sfx`. If no target is specified, it uses `/ram/cart`.

Caution! Picotron is still in development and revive has buggy behaviour when the target is already in memory; saving may not work propery. Use this function at your own risk.


## log

`log` will write to a text file in `appdata/logs`. The first non-flag argument is the file and everything else is the contents to write. There is no need to create the `logs` directory if it does not already exist, as that occurs automatically.  
The `-a` flag will append to the file rather than overwriting the file contents.  
If no file is specified, then it will write to `appdata/logs/log.txt`.  
The `log` terminal command relies on the logging function (confusingly, both are named `log.lua`). If the logging function is not correctly installed, the `log` terminal command will not work.


## startup.lua

This startup file does two things.  
A terminal instance is launced to the in the tooltray. It occupies a region in the top left of the tray, from the left side of the screen to just next to the current time.  
The logging function (not to be confused with the log terminal command) is mounted to `/ram/mount/log.lua`.  