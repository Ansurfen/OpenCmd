--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class golang
---@field mod golang_mod
local golang = {}

---@class golang_mod
local golang_mod = {}

function golang.mod.tidy() end

function golang.run() end

---@param opt table
function golang.build(opt) end

---@return string
function golang.version() end

---@param k string
---@param v string
function golang.env(k, v) end

---@return table<string, string>
function golang.env() end
