--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class pkg
---@field exist fun():boolean
---@field version fun():string
---@field install fun(package)
---@field uninstall fun(package: string)
local pkg = {}

---@return string
function pkg.version() end

---@return boolean
function pkg.exist() end

---@param package? string
function pkg.install(package) end

---@param package string
function pkg.uninstall(package) end
