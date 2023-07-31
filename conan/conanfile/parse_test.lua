--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@type conanfile
local conanfile = import("./index")

table.dump(conanfile.parse_dep("cjson"))
table.dump(conanfile.parse_dep("cjson/1.7.14"))
table.dump(conanfile.parse_dep("cjson/1.7.14@conan-center"))
table.dump(conanfile.parse_dep("cjson/1.7.14@conan-center/stable"))

print(conanfile.dep_to_string({
    name = "yock"
}))

print(conanfile.dep_to_string({
    name = "yock",
    version = "1.0.0"
}))

print(conanfile.dep_to_string({
    name = "yock",
    version = "1.0.0",
    remote = "conan-center"
}))

print(conanfile.dep_to_string({
    name = "yock",
    version = "1.0.0",
    remote = "conan-center",
    channel = "stable"
}))
