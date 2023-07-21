--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class docker
local docker = {}

---@param name string
function docker.pull(name) end

---@class dockeropt
---@field voulme string
---@field port string
---@field d boolean
---@field image string
---@field name string
local dockeropt = {}

---@param opt dockeropt
function docker.run(opt) end
