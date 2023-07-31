--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

local cmake = function()
    return argBuilder:new():add("cmake")
end

local version = function(opt)
    local res, err = cmake():add("--version"):exec({})
    yassert(err)
    if #res > 0 then
        return string.match(string.gsub(res[1], "\n", ""), "cmake version (%d+%.%d+%.%d+)")
    end
    return ""
end

---@class cmakelists
local cmakelists = {}

---@param opt table
local create = function(opt)
    if not find(pathf((opt["dir"] or "./"), "CMakeLists.txt")) then
        
    end
end

return {
    version = version,
    create = create
}
