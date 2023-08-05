local add_deps = function(...)
    print("npm install", ...)
end

local rm_deps = function(...)
    print("npm uninstall", ...)
end

local run = function()
    print("npm serve run")
end

return {
    add_deps = add_deps,
    rm_deps = rm_deps,
    run = run
}
