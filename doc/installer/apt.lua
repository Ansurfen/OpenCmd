--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class apt
---@field exist fun():boolean
---@field version fun():string
---@field search fun(package):table<string, install_result>
local apt = {}

---@return string
function apt.version() end

---@return boolean
function apt.exist() end

---@param package? string
---@return table<string, install_result>
function apt.search(package) end

---@param package? string
function apt.install(package) end

---@param package string
function apt.uninstall(package) end
