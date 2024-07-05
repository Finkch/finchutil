--[[
    a function that can log.

]]

function log(file, contents, argv)

    -- navigates to the home directory.
    -- im sure there's a better way of having consistent paths,
    -- but i'm no os expert.
    while (pwd() != "/") do cd("..") end
    
    -- sets default value
    argv = argv or {}

    if (not file) then
        print("log(file, contents, argv)")
        exit(1)
    end

    -- if no file was specified, default to log.txt
    if (not contents) then
        contents = file
        file = "log.txt"
    end

    -- gets target path for easy reference
    local target = "/appdata/logs/" .. file

    -- ensures the contents are a table
    if (type(contents) != "table") contents = {contents}

    -- ensures the logging folder exists
    if (not fstat("/appdata/logs")) mkdir("/appdata/logs")

    -- ensures the file exists
    if (not fstat(target)) store(target, "")

    -- checks whether to start from scratch or append to the file
    local append = false
    for i = 1, #argv do
        if (argv[i] == '-a') append = true
    end

    -- constructs the string to store
    local new_contents = ""

    if (append) new_contents = fetch(target)

    for i = 1, #contents do
        new_contents ..= contents[i] .. "\n"
    end

    -- writes to the file
    store(target, new_contents)
end