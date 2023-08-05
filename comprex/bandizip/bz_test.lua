--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@type bandizip
local bz = import("./index")

bz.compress({
    src = "./testdata",
    dst = "test.tar"
})

bz.uncompress({
    src = "test.tar",
    dst = "./test",
})
