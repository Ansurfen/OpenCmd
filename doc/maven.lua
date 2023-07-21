--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class maven
local maven = {}

---@class mavenpom
local mavenpom = {}

---@param file string
---@return mavenpom
function mavenpom:open(file) end

---@return string
function mavenpom:get_modelVersion() end

function mavenpom:dump() end
