--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

return {
    version = function()
        local res, err = sh({ redirect = false }, "apt -v")
        yassert(err)
        if #res > 0 then
            return string.match(string.gsub(res[1], "\n", ""), "apt (%d+%.%d+%.%d+)")
        end
        return ""
    end,
    exist = function()
        local _, err = sh({ redirect = false }, "apt")
        if err ~= nil then
            return false
        end
        return true
    end,
    search = function(package)
        if #package == 0 then
            package = "."
        end
        local res, err = sh({ redirect = false }, "apt-cache search " .. package)
        yassert(err)
        if #res > 0 then
            local tbl = strings.Split(res[1], "\n")
            local ret = {}
            for _, v in ipairs(tbl) do
                local before, after, ok = strings.Cut(v, "-")
                if ok then
                    ret[before] = {
                        desc = after
                    }
                end
            end
            return ret
        end
        return {}
    end,
    install = function(package)
        if #package == 0 then
            return
        end
        local _, err = sh("apt-get install " .. package)
        yassert(err)
    end,
    uninstall = function(package)
        if #package == 0 then
            return
        end
        local _, err = sh("apt-get purge " .. package)
        yassert(err)
    end
}
