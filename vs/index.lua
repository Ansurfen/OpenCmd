local channels = {
    ["master"] = { url = "https://aka.ms/vs/17/release/channel", id = "VisualStudio.17.Release" },
    ["2022_rc"] = { url = "https://aka.ms/vs/17/release/channel", id = "VisualStudio.17.Release" },
    ["2020_ltsc"] = { url = "https://aka.ms/vs/17/release.LTSC.17.0/channel", id = "VisualStudio.17.Release.LTSC.17.0" },
    ["2020_pre"] = { url = "https://aka.ms/vs/17/pre/channel", id = "VisualStudio.17.Preview" },
    ["2019_rc"] = { url = "https://aka.ms/vs/16/release/channel", id = "VisualStudio.16.Release" },
    ["2017_rc"] = { url = "https://aka.ms/vs/15/release/channel", id = "VisualStudio.15.Release" }
}

local install = function(opt)
    local arg_builder = argBuilder:new():add(".\\vs_installer.exe")
    arg_builder:add("install")
    -- handle path
    if opt.path == nil then
        opt.path = {}
    end
    -- handle product
    arg_builder:add_str("--productID Microsoft.VisualStudio.Product." .. (opt["product"] or ""), opt["product"])
    if opt.channel ~= nil then
        if type(opt.channel) == "table" then
            arg_builder:add_str("--channelURI " .. (opt.channel["url"] or ""), opt.channel["url"]):add_str(
                "--channelId " .. (opt.channel["id"] or ""), opt.channel["id"])
        elseif type(opt.channel) == "string" then
            local chan = channels[opt.channel]
            if chan ~= nil then
                arg_builder:add("--channelURI " .. chan.url):add("--channelId " .. chan.id)
            end
        end
    else
        arg_builder:add("--channelURI " .. channels["master"].url):add("--channelId " .. channels["master"].id)
    end

    arg_builder:add_str("--installPath " .. (opt.path["install"] or ""), opt.path["install"]):add_str(
        "--path cache=" .. (opt.path["cache"] or ""), opt.path["cache"]):add_str(
        "--path shared=" .. (opt.path["shared"] or ""), opt.path["shared"])
    -- handle components
    for _, comp in ipairs(opt.comps or {}) do
        arg_builder:add_str("--add " .. (comp or ""), comp)
    end
    for _, mix in ipairs(opt.mixin or {}) do
        arg_builder:add_str(mix, mix)
    end
    arg_builder:add_str("--addProductLang " .. (opt["lang"] or ""), opt["lang"])
    mkdir(opt.path["cache"] or "", opt.path["install"] or "", opt.path["install"] or "")
    arg_builder:add_bool("--quiet", opt["quiet"])
    print(arg_builder:build())
end

return {
    install = install
}
