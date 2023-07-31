--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class git
local git = {}

---@param repo string
function git.clone(repo) end

---@param repo string
---@param folder string
function git.clone(repo, folder) end

function git.add() end

function git.commit() end

function git.push() end

---@return string[]
function git.branch() end

---@param branch string
function git.checkout(branch) end

---@return string
function git.version() end
