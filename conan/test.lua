--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@type conan
local conan = import("./index")

print(conan.version())
conan.install({
    conanfile = ".",
    build = "missing",
    ["output-folder"] = "build"
})
