--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class javadependency
---@field groupId string
---@field artifactId string
---@field ver string
local javadependency = {}

---@class manifest
local manifest = {}

---@class jar
local jar = {}

---@class javac
local javac = {}

---@class java
---@field javac javac
---@field manifest manifest
---@field jar jar
local java = {}

---@param parser string
function java.dep_adapter(parser) end
