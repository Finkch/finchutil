-- like mount, but first removes anything at the target directory.
-- in essence, a forced mount

cd(env().path)

local target = '/ram/cart'
local origin = env().argv[1]

if (not origin) then
	print("mount target origin")
	exit(1)
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

local kind = fstat(origin)

print("bound "..kind.." "..origin.." at "..target)