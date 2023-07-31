--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

local add_deps = function(...)
    print("yarn add", ...)
end

local rm_deps = function()
    print("yarn uninstall")
end

local run = function()
    print("yarn run")
end

return {
    run = run,
    add_deps = add_deps,
    rm_deps = rm_deps
}
