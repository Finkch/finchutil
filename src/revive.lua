--[[
    revive is the opposite of close, it opens all working tabs
    in the specified directory. if no directory is specified,
    opens all default working tabs in /ram/cart.

    note: revive can only be called if there are no active tabs.

]]

cd(env().path)


-- checks if there are active tabs
local p = fetch("/ram/system/processes.pod")
for i=1,#p do
    if p[i].name == "code" or p[i].name == "sfx" or p[i].name == "map" or p[i].name == "gfx" then
        print("cannot revive while there are open tabs")
        exit(1)
    end
end

local target = "/ram/cart"


-- opens an item in each of the four main groups
if (fstat(target .. "/main.lua")) then
    create_process("/system/apps/code.p64", {argv={target .. "/main.lua"}})
end

if (fstat(target .. "/gfx/0.gfx")) then
    create_process("/system/apps/gfx.p64", {argv={target .. "/gfx/0.gfx"}})
end

if (fstat(target .. "/map/0.map")) then
    create_process("/system/apps/map.p64", {argv={target .. "/map/0.map"}})
end

if (fstat(target .. "/sfx/0.sfx")) then
    create_process("/system/apps/sfx.p64", {argv={target .. "/sfx/0.sfx"}})
end

print("revived working tabs")