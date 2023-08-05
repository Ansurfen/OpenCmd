---@diagnostic disable: undefined-global
local jspm = {}

function jspm:new(opt)
    local obj = {
        pm = {}
    }
    setmetatable(obj, { __index = self })
    setmetatable(obj.pm, { __index = self.pm })
    local pm
    local _switch = {
        ["npm"] = function()
            pm = import("npm@1.0")
        end,
        ["yarn"] = function()
            pm = import("yarn@1.0")
        end,
        ["pnpm"] = function()
            pm = import("pnpm@1.0")
        end
    }
    local f = _switch[(opt["module"] or "npm")]
    if type(f) == "function" then
        f()
        if pm ~= nil then
            obj.pm = pm
        else
            yassert("invalid package manager")
        end
    end
    return obj
end

function jspm:add_deps(...)
    self.pm.add_deps(...)
end

function jspm:rm_deps()

end

function jspm:run()

end

return jspm
