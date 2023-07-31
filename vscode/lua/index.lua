--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

return {
    workspace = {
        library = {
            add = function(...)
                local setting = json.create(pathf("$/.vscode/settings.json"), "{}")
                local libraries = setting:rawget("Lua.workspace.library")
                if type(libraries) == "table" then
                    for _, value in ipairs({ ... }) do
                        table.insert(libraries, value)
                    end
                end
                setting:rawset("Lua.workspace.library", libraries)
                setting:save(true)
                -- import("../index").settings():add({ ... }, {
                --     dumplicate = false,
                --     key = "Lua.workspace.library",
                --     type = "array"
                -- })
            end
        }
    }
}
