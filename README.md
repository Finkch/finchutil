# finkchutil

A handful of system utility functions for the fantasy workstation Picotron. These functions focus on integrating external editors into the Picotron workflow.


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