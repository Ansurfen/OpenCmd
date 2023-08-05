--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class installer
---@field exist fun():boolean
---@field version fun():string
---@field search fun(pacakge: string):table<string, install_result>
---@field install fun(package: string)
---@field uninstall fun(package: string)
---@field update fun()
---@field info fun()
---@field list fun()
local installer = {}

---@return boolean
function installer.exist() end

---@return string
function installer.version() end

---@param package? string
---@return table<string, install_result>
function installer.search(package) end

---@class install_result
---@field ver string
---@field desc string
local install_result = {}

---@param package? string
function installer.install(package) end

---@param package string
function installer.uninstall(package) end

function installer.update() end
