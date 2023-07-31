--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class conan
local conan = {}

---@return string
function conan.version() end

---@class conan_install_opt
---@field conanfile string
---@field build string|"missing"|"never"|"cascade"|"*"
local conan_install_opt = {}

---@param opt conan_install_opt
function conan.install(opt) end

---@class conanfile
---@field file string
---@field buf table<string, table>
local conanfile = {}

---@param file string
---@return conanfile
function conanfile.open(file) end

---@param file string
---@return conanfile
function conanfile.create(file) end

---@vararg string
function conanfile:add_deps(...) end

---@vararg string
function conanfile:rm_deps(...) end

---@vararg string
function conanfile:add_gen(...) end

---@vararg string
function conanfile:rm_gen(...) end

---@return string
function conanfile:to_string() end

function conanfile:save() end

---@param v conan_dependency
---@return string
function conanfile.dep_to_string(v) end

---@param v string
---@return conan_dependency
function conanfile.parse_dep(v) end

---@class conan_dependency
---@field name string
---@field version? string
---@field remote? string
---@field channel? string
local conan_dependency = {}
