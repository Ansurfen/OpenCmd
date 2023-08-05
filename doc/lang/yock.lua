--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class yock
local yock = {}

---@class yock_run_opt
---@field script string
---@field task? string[]
---@field cooperate? boolean
---@field parameter? table
local yock_run_opt = {}

---@param opt yock_run_opt
function yock.run(opt) end
