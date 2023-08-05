return {
    exist = function()
        local _, err = sh("yum")
        if err ~= nil then
            return false
        end
        return true
    end,
    version = function()
        local res, err = sh("yum -v")
        yassert(err)
        if #res > 0 then

        end
        return ""
    end,
    install = function(package)
        if #package == 0 then
            return
        end
        local _, err = sh("yum install " .. package)
        yassert(err)
    end,
    uninstall = function(package)
        if #package == 0 then
            return
        end
        local _, err = sh("yum uninstall " .. package)
        yassert(err)
    end,
    search = function(package)
        local res, err = sh("yum search " .. package)
        yassert(err)
        if #res > 0 then
            local tbl = strings.Split(res[1], "\n")
            local sep = false
            local tmp = {}
            for _, value in ipairs(tbl) do
                if strings.Contains(value, "===") then
                    sep = true
                end
                if sep then
                    local name, desc, ok = strings.Cut(value, ":")
                    if ok then
                        tmp[strings.TrimSpace(name)] = {
                            desc = strings.TrimSpace(desc)
                        }
                    end
                end
            end
            return tmp
        end
        return {}
    end,
    list = function()
        local res, err = sh("yum list")
        yassert(err)
        if #res > 0 then
            local tbl = String.Split(res[1], "\n")
            for _, value in ipairs(tbl) do
                -- todo , tidy reduandent
                -- local  = strings.SplitN(value, " ", 3)
            end
        end
    end
}
