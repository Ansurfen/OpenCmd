--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

return {
    version = function()
        local data, err = sh("choco -v")
        yassert(err)
        if #data > 0 then
            return data[1]
        end
        return ""
    end,
    exist = function()
        local _, err = sh("choco")
        if err ~= nil then
            return false
        end
        return true
    end,
    search = function(package)
        local res, err = sh({ redirect = false }, "choco search " .. package)
        yassert(err)
        if #res > 0 then
            local tbl = strings.Split(res[1], "\n")
            table.remove(tbl, 1)
            table.remove(tbl, #tbl)
            table.remove(tbl, #tbl)
            local ret = {}
            for _, v in ipairs(tbl) do
                res = strings.SplitN(v, " ", 3)
                if #res == 3 then
                    ret[res[1]] = {
                        ver = res[2],
                        desc = res[3]
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
        local _, err = sh("choco install " .. package)
        yassert(err)
    end,
    uninstall = function(package)
        if #package == 0 then
            return
        end
        local _, err = sh("choco uninstall  " .. package)
        yassert(err)
    end
}
