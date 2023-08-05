return {
    version = function()
        local data, err = sh("dnf --version")
        yassert(err)
        if #data > 0 then
            return string.match(data[1], "(%d+.%d+.%d)")
        end
        return ""
    end,
    exist = function()
        local _, err = sh("dnf")
        if err ~= nil then
            return false
        end
        return true
    end,
    install = function(package)
        if #package == 0 then
            return
        end
        local _, err = sh("dnf install " .. package)
        yassert(err)
    end,
    uninstall = function(package)
        if #package == 0 then
            return
        end
        local _, err = sh("dnf uninstall  " .. package)
        yassert(err)
    end,
    list = function()

    end,
    search = function(package)
        local res, err = sh("dnf search ", package)
        yassert(err)
    end
}
