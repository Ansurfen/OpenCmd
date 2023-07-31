--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

local yock = function()
    return argBuilder:new():add("yock")
end

local run = function(opt)
    local cmd = yock():add("run"):add_strf("%s", opt["script"]):add_bool("-c", opt["cooperate"]):add(strings.Join(
        opt["task"],
        " ")):add("--")
    for key, value in pairs(opt["parameter"]) do
        cmd:add(string.format("--%s %s", key, value))
    end
    for _, value in ipairs(opt["parameter"]) do
        cmd:add(string.format("--%s", value))
    end
    sh(cmd:build())
end

return {
    run = run
}
