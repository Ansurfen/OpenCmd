---@type cmake
local cmake = import("./index")
print(cmake.version())

-- local ls = cmake.create({
--     dir = ".",
--     project = "demo",
--     minium_requried = 3.15
-- })
-- ls:find_package("cjson", true)
-- ls:target_link_libraries()
-- CMakeLists.txt
