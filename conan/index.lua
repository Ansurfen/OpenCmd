--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

local conan = function()
    return argBuilder:new():add("conan")
end

local version = function()
    local res, err = conan():add("-v"):exec({})
    yassert(err)
    if #res > 0 then
        return res[1]
    end
    return ""
end

return {
    version = version
}
