--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@diagnostic disable-next-line: lowercase-global
function cmdparse(cmd, todo)
    local args = strings.Fields(cmd)
    local res = {}
    for i = 1, #args, 1 do
        local arg = args[i]
        if todo[arg] == flag_type.str then
            i = i + 1
            if args[i] ~= nil then
                res[arg] = args[i]
                i = i + 1
            end
        elseif todo[arg] == flag_type.num then
            i = i + 1
            if args[i] ~= nil then
                res[arg] = args[i]
                i = i + 1
            end
        elseif todo[arg] == flag_type.arr then
            i = i + 1
            if args[i] ~= nil then
                if res[arg] == nil then
                    res[arg] = {}
                end
                table.insert(res[arg], args[i])
                i = i + 1
            end
        elseif todo[arg] == flag_type.bool then
            res[arg] = true
        end
    end
    return res
end

return cmdparse
