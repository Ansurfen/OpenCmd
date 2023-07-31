--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

local git = function()
    return argBuilder:new():add("git")
end

return {
    clone = function(arg1, arg2)
        local cmd = git():add("clone")
        if type(arg1) == "string" and type(arg2) == "string" then
            cmd:add(arg1):add(arg2)
        elseif type(arg1) == "string" and arg2 == nil then
            cmd:add(arg1)
        elseif type(arg1) == "table" then

        end
        sh(cmd:build())
    end,
    branch = function()
        local data, err = git():add("branch"):exec({})
        yassert(err)
        for i, v in ipairs(data) do
            data[i] = strings.TrimSuffix(v, "\n")
        end
        return data
    end,
    checkout = function(branch)
        git():add("checkout"):add(branch):exec({
            redirect = true
        })
    end,
    version = function()
        local res, err = git():add("version"):exec({})
        yassert(err)
        if #res > 0 then
            return string.match(string.gsub(res[1], "\n", ""), "git version (%d+.%d+.%d+)")
        end
        return ""
    end
}
