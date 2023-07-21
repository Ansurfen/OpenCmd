--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class gradle
local gradle = {}

---@param file string
---@return gradle
function gradle:open(file) end

---@param deps javadependency[]
function gradle:add_deps(deps) end

---@param deps javadependency[]
function gradle:rm_deps(deps) end

---@return javadependency[]
function gradle:get_deps() end

function gradle:dump() end

---@param opt table
function gradle:init(opt) end