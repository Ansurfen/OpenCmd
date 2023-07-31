--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.
---@diagnostic disable: duplicate-set-field

---@type conanfile
local conanfile = {
    buf = {},
    file = ""
}

---@return conan_dependency
local parse_dep = function(v)
    if strings.Contains(v, "/") then
        local name, after, ok = strings.Cut(v, "/")
        if ok and strings.Contains(after, "@") then
            local version, after, ok = strings.Cut(after, "@")
            if ok and strings.Contains(after, "/") then
                local remote, channel, ok = strings.Cut(after, "/")
                if ok then
                    return {
                        name = name,
                        version = version,
                        remote = remote,
                        channel = channel
                    }
                else
                    return {
                        name = name,
                        version = version,
                        remote = after
                    }
                end
            else
                return {
                    name = name,
                    version = version,
                    remote = after
                }
            end
        else
            return {
                name = name,
                version = after
            }
        end
    end
    return {
        name = v
    }
end

---@param v conan_dependency
---@return string
local dep_to_string = function(v)
    if v.channel ~= nil and v.remote ~= nil and v.version ~= nil and v.name ~= nil then
        return string.format("%s/%s@%s/%s", v.name, v.version, v.remote, v.channel)
    elseif v.remote ~= nil and v.version ~= nil and v.name ~= nil then
        return string.format("%s/%s@%s", v.name, v.version, v.remote)
    elseif v.version ~= nil and v.name ~= nil then
        return string.format("%s/%s", v.name, v.version)
    elseif v.name ~= nil then
        return v.name
    end
    return ""
end

local parse = function(tbl)
    local requires = {}
    for _, v in ipairs(tbl["requires"]) do
        local dep = parse_dep(v)
        requires[dep.name] = {
            version = dep.version,
            remote = dep.remote,
            channel = dep.channel,
        }
    end
    tbl["requires"] = requires
end

---@param file string
---@return conanfile
local open = function(file)
    local obj = {
        file = file,
        buf = {}
    }
    local raw, err = cat(file)
    yassert(err)
    local cur = {}
    for _, value in ipairs(strings.Split(raw, "\n")) do
        if strings.Contains(value, "[") then
            cur = {}
            obj.buf[string.match(value, "%a+")] = cur
        else
            value = strings.TrimSpace(value)
            if #value > 0 then
                table.insert(cur, value)
            end
        end
    end
    parse(obj.buf)
    setmetatable(obj, { __index = conanfile })
    return obj
end

---@param file string
---@return conanfile
local create = function(file)
    if not find(file) then
        write(file, [[
[requires]

[generators]

]])
    end
    return open(file)
end

function conanfile:to_string()
    local res = ""
    for name, value in pairs(self.buf) do
        res = res .. string.format("[%s]\n", name)
        if name == "requires" then
            for k, v in pairs(value) do
                v.name = k
                res = res .. dep_to_string(v) .. "\n"
            end
        else
            for _, vv in ipairs(value) do
                res = res .. vv .. "\n"
            end
        end

        res = res .. "\n"
    end
    return strings.TrimSuffix(res, "\n")
end

---@vararg string
function conanfile:add_deps(...)
    for _, value in ipairs({ ... }) do
        local dep = parse_dep(value)
        if self.buf.requires[dep.name] == nil then
            self.buf.requires[dep.name] = {
                version = dep.version,
                remote = dep.remote,
                channel = dep.channel,
            }
        end
    end
end

---@vararg string
function conanfile:rm_deps(...)
    for _, value in ipairs({ ... }) do
        local dep = parse_dep(value)
        if self.buf.requires[dep.name] ~= nil then
            self.buf.requires[dep.name] = nil
        end
    end
end

---@vararg string
function conanfile:add_gen(...)
    for _, gen in ipairs({ ... }) do
        local found = false
        for _, v in ipairs(self.buf["generators"]) do
            if v == gen then
                found = true
                break
            end
        end
        if not found then
            table.insert(self.buf["generators"], gen)
        end
    end
end

---@vararg string
function conanfile:rm_gen(...)
    for _, gen in ipairs({ ... }) do
        local idx = 0
        for i, v in ipairs(self.buf["generators"]) do
            if v == gen then
                idx = i
                break
            end
        end
        if idx > 0 then
            table.remove(self.buf["generators"], idx)
        end
    end
end

function conanfile:save()
    write(self.file, self:to_string())
end

return {
    open = open,
    create = create,
    parse_dep = parse_dep,
    dep_to_string = dep_to_string
}
