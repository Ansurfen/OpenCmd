--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@type golang
local golang = import("./index")

print(golang.version())
golang.mod.tidy()
golang.build({
    packages = { "." },
    output = wrapexf("yock"),
    ldflags = {
        X = {
            ["github.com/ansurfen/yock/util.YockBuild"] = "release",
            ["github.com/ansurfen/yock/util.YockVersion"] = "0.0.22",
        }
    },
})
table.dump(golang.env())
golang.env("GOOS", "darwin")
