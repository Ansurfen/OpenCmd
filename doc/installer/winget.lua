--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class winget
---@field exist fun():boolean
---@field version fun():string
---@field install fun(package)
---@field uninstall fun(package: string)
local winget = {}

---@return string
function winget.version() end

---@return boolean
function winget.exist() end

---@param package? string
function winget.install(package) end

---@param package string
function winget.uninstall(package) end