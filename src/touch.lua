--[[pod_format="raw",created="2024-07-05 18:06:51",modified="2024-07-05 18:12:50",revision=3]]
--[[
	creates a file or leaves an existing file unchanged.
	used to make sure a file exists somewhere.
	
	pretty much a copy of...
	https://github.com/Rayquaza01/picotron-utilities/blob/main/src/exports/appdata/system/util/touch.lua
	...but i reimplemented it because i like to do everything myself.
]]

cd(env().path)
local target = env().argv[1]

-- shows usage
if (not target) then
	print("touch file")
	exit(1)
end

-- gets file contents
local content = fetch(target)

-- if no file contnets, i.e. no file, then create empty contents
if (not content) content = ""

-- returns contents back to the file
store(target, content)
