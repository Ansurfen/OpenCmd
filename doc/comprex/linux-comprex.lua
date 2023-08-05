--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class linuxcomprex
local linuxcomprex = {}

---@class linuxcomprexopt
---@field src string
---@field dst string
---@field redirect boolean
local linuxcomprexopt = {}

---@param opt linuxcomprexopt
function linuxcomprex.compress(opt) end

---@param opt linuxcomprexopt
function linuxcomprex.uncompress(opt) end
