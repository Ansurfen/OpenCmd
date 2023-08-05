--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@diagnostic disable-next-line: missing-fields
option({
    ycho = {
        stdout = true
    }
})

local golang = function()
    return argBuilder:new():add("go")
end

local version = function()
    local res, err = golang():add("version"):exec({})
    yassert(err)
    if #res > 0 then
        return string.match(string.gsub(res[1], "\n", ""), "go version go(%d+.%d+)")
    end
    return ""
end

return {
    version = version,
    build = function(opt)
        local cmd = golang():add("build"):add_strf("-o %s", opt["output"])
        local ldflags = ""
        for key, value in pairs(opt["ldflags"]) do
            if key == "X" then
                for kk, vv in pairs(value) do
                    ldflags = ldflags .. string.format([[-X '%s=%s' ]], kk, vv)
                end
                ldflags = strings.TrimSuffix(ldflags, " ")
            end
        end
        sh(cmd:add_strf([[-ldflags "%s"]], ldflags):add_arr(opt["packages"]):build())
    end,
    run = function(opt)
        golang():add("run")
    end,
    mod = {
        tidy = function()
            golang():add("mod"):add("tidy"):exec({
                redirect = true
            })
        end
    },
    env = function(arg1, arg2)
        if arg1 == nil and arg2 == nil then
            local data, err = golang():add("env -json"):exec({})
            yassert(err)
            if #data > 0 then
                return json.decode(data[1])
            end
            return {}
        elseif type(arg1) == "string" and type(arg2) == "string" then
            golang():add_format(#arg1 > 0 and #arg2 > 0, "env -w %s=%s", arg1, arg2):exec({})
        end
    end
}
