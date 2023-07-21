--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

local cmake = function()
    return argBuilder:new():add("cmake")
end

local version = function(opt)
    cmake():add("--version"):exec({
        redirect = opt["redirect"] or false
    })
end

return {
    version = version
}
