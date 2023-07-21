--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class bandizip
local bandizip = {}

---@class bandizipopt
---@field src string
---@field dst string
---@field redirect boolean
local bandizipopt = {}

---@param opt bandizipopt
function bandizip.compress(opt) end

---@param opt bandizipopt
function bandizip.uncompress(opt) end
