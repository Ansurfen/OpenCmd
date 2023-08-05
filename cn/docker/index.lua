--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

local docker_builder = function()
    return argBuilder:new():add("docker")
end

local pull = function(image)
    return docker_builder():add("pull"):add_str(image, image)
end

local run = function(opt)
    return docker_builder():add("run"):add_str("-p " .. (opt["port"] or ""), opt["port"]):add_bool("-d", opt["d"])
        :add_str(
            "-v " .. (opt["voulme"] or ""), opt["voulme"]):add_str("--name=" .. (opt["name"] or ""), opt["name"])
        :add_str(
            opt["image"],
            opt["image"])
end

return {
    pull = pull,
    run = run
}
