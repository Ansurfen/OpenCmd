--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class chocolatey
---@field exist fun():boolean
---@field version fun():string
---@field search fun(pacakge):table<string, install_result>
---@field install fun(package)
---@field uninstall fun(package: string)
local chocolatey = {}

---@return string
function chocolatey.version() end

---@return boolean
function chocolatey.exist() end

---@param pacakge? string
---@return table<string, install_result>
function chocolatey.search(pacakge) end

---@param package? string
function chocolatey.install(package) end

---@param package string
function chocolatey.uninstall(package) end