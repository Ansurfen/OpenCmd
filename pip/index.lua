---@diagnostic disable: undefined-global
local pip = function(...)
    return cmdf("pip", ...)
end

local version = function()
    return sh(pip("--version"))
end

return {
    version = version
}
