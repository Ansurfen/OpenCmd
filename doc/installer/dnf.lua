--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class dnf
---@field exist fun():boolean
---@field version fun():string
---@field install fun(package)
---@field uninstall fun(package: string)
local dnf = {}

---@return string
function dnf.version() end

---@return boolean
function dnf.exist() end

---@param package? string
function dnf.install(package) end

---@param package string
function dnf.uninstall(package) end
