--[[
    closes all current working tabs.

    kills all editor tab items. these include:
    code, gfx, map, and sfx.

    when binding or mounting, these open editors can safe
    their new, empty contents to the bound/mounted directory,
    thereby deleting file contents. this is used to kill
    the processes before they can kill your code.
    it's a dog-eat-dog world out there.
]]

local p = fetch"/ram/system/processes.pod"

local c = 0 -- tracks culled count

for i=1,#p do

    -- checks if the process matches a known process
    if p[i].name == "code" or p[i].name == "sfx" or p[i].name == "map" or p[i].name == "gfx" then

        -- for some reason, "kill()" isn't recognised. instead,
        -- it's getting a 'global is nil' error. hence the code
        -- for kill is just copied here
        send_message(2, {event="kill_process", proc_id = p[i].id})

        c += 1
    end
	
end

print("culled " .. c .. " processes")