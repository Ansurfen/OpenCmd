---@diagnostic disable: undefined-global
local gum = function()
    return argBuilder:new():add("gum")
end



return {
    ---@param opt table
    spin = function(opt)
        local g = gum():add("spin")
        local title = opt["title"]
        g:add_str("-s " .. (opt["spinner"] or "dot"), opt["spinner"]):add_str(
            string.format([[--title="%s"]], title or ""),
            title):add(opt["cmd"] or "")
        g:exec({
            redirect = opt["redirect"] or true,
        })
    end,
    pager = function(opt)
        local g = gum():add("pager"):add(opt["content"] or "")
        g:exec({
            redirect = opt["redirect"] or true,
        })
    end,
    choose = function(opt)
        local choices = strings.Join(opt["choices"] or {}, " ")
        local g = gum():add("choose"):add(choices)
        local res, err = g:exec({
            redirect = opt["redirect"] or true,
        })
        yassert(err)
        table.dump(res)
    end
}
