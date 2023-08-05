--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class yum
---@field exist fun():boolean
---@field version fun():string
---@field search fun(package):table<string, install_result>
local yum = {}

---@return string
function yum.version() end

---@return boolean
function yum.exist() end

---@param package? string
---@return table<string, install_result>
function yum.search(package) end

---@param package? string
function yum.install(package) end

---@param package string
function yum.uninstall(package) end
