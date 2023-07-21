---@diagnostic disable: undefined-global
local nodes = {
    xmake = {

    },
    camke = {

    },
    mingw = {

    },
    msvc = {

    },
    conan = {

    }
}

local plans = {
    xmkae_msvc = { path = { nodes["xmake"], nodes["msvc"] } },
    conan_cmake_mingw = {
        path = { nodes["conan"], nodes["cmake"], nodes["mingw"] },
        install = function()

        end,
        init = function()
            write_file("conanfile.txt", "[requires]\n[generators]\nCMakeDeps\nCMakeToolchain")
        end
    }
}

---@diagnostic disable: undefined-global
local install = function(opt)
    print(opt["lib"])
    local cpm = jsonfile:open(cur_dir() .. "/cpm.json")

    table.dump(cpm.buf)
end

return {
    install = install
}
