--[[
    a startup script for my picotron.

    place this in /appdata/system.
]]

cd(env().path)

-- opens a terminal instance in the tooltray
create_process("../../system/apps/terminal.lua", {window_attribs = {workspace = "tooltray", x=2, y=2, width=360, height=80}})
