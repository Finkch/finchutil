--[[
	
	Dumps the current cartridge's contents to storage.
	
	Useful for developing using external editor.

]]

cd(env().path)

local argv = env().argv

-- Acquires target directory
local path = nil
if (not argv[1]) then
	print("no directory specified, writing to \"dump\"")
	path = "dump"
else
	path = argv[1]
end

-- Clears directory if it exists
if (fstat(path) == "folder") or (fstat(path) == "file") then
	err = rm(path)
	if (err) then
		print(err)
		exit(0)
	end
end

-- Creates directory at the path
err = mkdir(path)
if (err) then
	print(err)
	exit(0)
end

-- Gets a list of all files to be dumped
local res = ls("ram/cart")
if (not res) then
	print("cartridge not found")
	exit(0)
end

-- Copies all files to the dump folder
for i = 1, #res do
	local err = cp("ram/cart/" .. res[i], path .. "/" .. res[i])
	if (err) print(err)
end	