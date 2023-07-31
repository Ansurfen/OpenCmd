--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@type conanfile
local conanfile = import("./index")

local c = conanfile.create("conanfile.txt")
c:add_gen("CMakeDeps", "CMakeToolchain")
c:add_deps("cjson/1.7.14", "libffi/3.4.4")
c:rm_deps("cjson")
c:save()
