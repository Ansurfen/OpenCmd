--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@meta _

---@class gum
local gum = {}

---@alias  spinner_type string
---|"line"
---|"dot"
---|"minidot"
---|"jump"
---|"pulse"
---|"points"
---|"globe"
---|"moon"
---|"monkey"
---|"meter"
---|"hamburger"

---@class gumspinopt
---@field spinner spinner_type
---@field title string
---@field cmd string
---@field redirect true
local gumspinopt = {}

---@param opt gumspinopt
function gum.spin(opt) end

---@param opt table
function gum.pager(opt) end

---@param opt table
function gum.choose(opt) end
