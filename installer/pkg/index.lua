--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

return {
    version = function()
        local data, err = sh("pkg -v")
        yassert(err)
        if #data > 0 then
            return data[1]
        end
        return ""
    end,
    exist = function()
        local _, err = sh("pkg")
        if err ~= nil then
            return false
        end
        return true
    end,
    install = function(package)
        if #package == 0 then
            return
        end
        local _, err = sh("pkg install " .. package)
        yassert(err)
    end,
    uninstall = function(package)
        if #package == 0 then
            return
        end
        local _, err = sh("pkg uninstall  " .. package)
        yassert(err)
    end
}
