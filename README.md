# finkchutil

A handful of system utility functions for the fantasy workstation Picotron. These functions focus on integrating external editors into the Picotron workflow.

## instilation

To install this library, copy the `.lua` files from `src` into your Picotron's `util` folder (`/appdata/system/util`). If the `util` directory does not exist, make one at the location.  
To install the startup script, copy `startup.lua` from the `startup` directory to your Picotron's `system` folder (`/appdata/system`).  
To install the misc functions, either the individual lua files from `/misc` to `/appdata/system` or the `/misc` directory itself.  

Alternatively, you can store the files on your host OS and mount the directory to its respective location on Picotron. To do so, edit your Picotron's `config` file (see [Picotron User Manual](https://www.lexaloffle.com/dl/docs/picotron_manual.html) for where to find the config file). You may mount the directory containing the files or the files themselves.

## command line functions

### dump

`dump` copies the current cartridge in RAM to the specified folder. If no folder is specified, it creates a folder called "dump".  
Warning: this command deletes preexisting contents of the specified folder.


### close

`close` closes all active tabs, those being all process instances of `code.p64`, `gfx.p64`, `map.p64`, and `sfx.p64`.


### bind

`bind` is similar to `mount` where it mounts an origin directory to a target location. Unlike `mount`, `bind` will delete any preexisting directory at the target location. Also unlike `mount`, if only one argument is specified then the argument is the origin and the target is `/ram/cart`.  
If the target is `/ram/cart`, then the program workin context becomes the target.  


### revive

`revive` opens the `/ram/cart`'s primary working tabs, those being the `main.lua`, `gfx/0.gfx`, `map/0.map`, and `sfx/0.sfx`. It will fail if there are current active tabs; all tabs must be closed.  

Caution! Picotron is still in development and revive has buggy behaviour. Revive may need to be called twice for it to succeed.  


### log

`log` will write to a text file in `appdata/logs`. The first non-flag argument is the file and everything else is the contents to write. There is no need to create the `logs` directory if it does not already exist, as that occurs automatically.  
The `-a` flag will append to the file rather than overwriting the file contents.  
If no file is specified, then it will write to `appdata/logs/log.txt`.  
The `log` terminal command relies on the logging function (confusingly, both are named `log.lua`). If the logging function is not correctly installed, the `log` terminal command will not work.


## misc functions

These functions are lua files to be included in cartridges for some utility. They should not be called from the command line.  


### logger

The logging function (not to be confused with the [log terminal command](#log)) uses the same syntax as the [log terminal command](#log) except the optional flag arguments (`-a`) is passed in a table as the last argument. This function writes data to the specified file, or to the `log.txt` file if no files were specified.  
To include the logger, use `include("../finkchlib/log.lua")`.  


### tstr

This module contains three functions used to perform better prints, specifically for tables. When encountering a table, the `printt` function will print the table contents. It does so be calling the `to_string` function which returns a stringified version of the passed argument. Both use the underlying `table_to_string` function, which recursively builds a string to represent a table's contents.  
If you want to print the object, use `printt`. If you want a string version on an object, use `to_string`. You should never need to use `table_to_string`.  
To include the tstr module, use `include("../finkchlib/tstr.lua")`.  


## startup.lua

This startup file does two things.  
A terminal instance is launced to the in the tooltray. It occupies a region in the top left of the tray, from the left side of the screen to just next to the current time.  
The misc functions are mounted from `/appdate/system/finkchlib` to `/ram/finkchlib`.  