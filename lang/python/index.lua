---@diagnostic disable: undefined-global

local python = {}

function python:new(opt)
    local obj = {}
    setmetatable(obj, { __index = self })
    self.exf = opt["exf"] or ""
    self.ver = opt["ver"] or ""
    return obj
end

function python:version()
    return sh(cmdf("python", "-V"))
end

return python
