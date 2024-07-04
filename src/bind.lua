--[[ 
	like mount, but first removes anything at the target directory.
	in essence, a forced mount.

	if only one argument has been specified, it default the target
	to /ram/cart.
]] 

cd(env().path)

local target = env().argv[1]
local origin = env().argv[2]

if (not target) then
	print("bind target origin | bind origin")
end

if (not origin) then
	origin = target
	target = "/ram/cart"
end

if (not fstat(origin)) then
	print("origin not found: "..origin)
	exit(1)
end


-- if the target doesn't exist, then mount as per usual
if (not fstat(target)) then
    print("no cart detected, proceeding with mount")
    mount(target, origin)
    exit(0)
end


-- removes target location
rm(target)

-- mounts
mount(target, origin)

-- gets directory type for printout
local kind = fstat(origin)

print("bound "..kind.." "..origin.." at "..target)