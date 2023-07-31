--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@diagnostic disable-next-line: missing-fields
option({
    ycho = {
        stdout = false
    }
})

local conan = function()
    return argBuilder:new():add("conan")
end

local version = function()
    local res, err = conan():add("-v"):exec({})
    yassert(err)
    if #res > 0 then
        return string.match(string.gsub(res[1], "\n", ""), "Conan version (.*)")
    end
    return ""
end

local install = function(opt)
    sh(conan():add("install"):add_str(opt["conanfile"], opt["conanfile"]):add_strf("--output-folder=%s",
        opt["output-folder"]):add_strf("--build=%s", opt["build"]):build())
end

return {
    version = version,
    install = install
}
