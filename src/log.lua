--[[
	this terminal command launches the logging function.
	
]]

-- i don't know pathing well
while (pwd() != "/") do cd("..") end

-- gets the logging function.
-- yes, bad practice to include on a terminal command but
-- i want the log function to be visible to cartridges too.
include("/ram/mount/log.lua")

local argv = env().argv

local flags = {}
local file = nil
local content = nil


-- used for getting file versus contents
local first_arg = true
local second_arg = true

-- gets data from the arguments
for i = 1, #argv do

	-- whether to append
	if (argv[i] == "-a") then
		flags = {argv[i]}

	-- the file
	elseif (first_arg) then
		file = argv[i]
		first_arg = false

	-- contents
	else
		if (not content) content = ""
		content ..= argv[i] .. " "
	end
end

-- tells user how to use the command if they didn't specify everything
if (not file) then
	print("log file contents | log contents")
	exit(1)
end

-- logs
log(file, {content}, flags)