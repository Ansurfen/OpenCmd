---@type git
local git = import("./index")

-- git.clone("a", "myfolder")
table.dump(git.branch())
git.checkout("main")
print(git.version())
