--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@type yock
local yock = import("./index")

yock.run({
    task = { "a", "b", "c" },
    script = "x.lua",
    cooperate = true,
    parameter = {
        ["all-os"] = "linux",
        "all-enable"
    }
})
