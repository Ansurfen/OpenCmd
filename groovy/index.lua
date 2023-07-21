--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

local groovy = function()
    return argBuilder:new():add("groovy")
end

local version = function(opt)
    groovy():add("-v"):exec({
        redirect = opt["redirect"] or false
    })
end

return {
    version = version
}
