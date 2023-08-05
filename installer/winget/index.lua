--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

return {
    exist = function()
        local _, err = sh("winget")
        if err ~= nil then
            return false
        end
        return true
    end,
    version = function()
        local data, err = sh("winget -v")
        yassert(err)
        if #data > 0 and #data[1] > 0 then
            return string.sub(data[1], 2, #data[1])
        end
        return ""
    end,
    search = function(package)
        yassert("no implementation")
        local res, err = sh({ redirect = false }, "winget search " .. package)
        yassert(err)
        res = strings.Split(res[1], "\n")
        local title = strings.TrimSpace(res[1])
        local loc = {}
        local flag = true
        local base
        for i = 1, #title, 1 do
            local ch = string.sub(title, i, i)
            if ch == '-' or ch == '\\' or ch == '/' or ch == '|' then
                goto continue
            end
            if ch ~= 226 and flag and (string.byte(ch) > 127 or ch == 'I') then
                flag = false
                print(i, string.byte(ch))
                if base == nil then
                    base = i - 1
                end
                table.insert(loc, i - base)
            elseif not flag and ch == ' ' then
                flag = true
            end
            ::continue::
        end
        table.remove(res, 1)
        table.remove(res, 1)
        table.remove(res, #res)
        table.dump(loc)
        local idx = {}
        for _, value in ipairs(res) do
            local name = strings.TrimSpace(string.sub(value, loc[1], loc[2] - 1))
            idx[name] = {
                ID = strings.TrimSpace(string.sub(value, loc[2], loc[3] - 3)),
                Version = strings.TrimSpace(string.sub(value, loc[3] - 1, loc[4] - 3)),
                Match = strings.TrimSpace(string.sub(value, loc[4] - 2, loc[5] - 3)),
                Source = strings.TrimSpace(string.sub(value, loc[5] - 3, #value))
            }
        end
        if #idx > 0 then
            table.dump(idx[1])
        end
        table.dump(idx)
    end,
    list = function()

    end,
    install = function(package)
        if #package == 0 then
            return
        end
        local _, err = sh("winget install " .. package)
        yassert(err)
    end,
    uninstall = function(package)
        if #package == 0 then
            return
        end
        local _, err = sh("winget uninstall " .. package)
        yassert(err)
    end
}
