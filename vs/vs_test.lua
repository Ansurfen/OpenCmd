--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

---@diagnostic disable-next-line: undefined-global
local vs_installer = import("vs@1.0")
vs_installer.install({
    quiet = false,
    comps = {
        "Microsoft.VisualStudio.Workload.CoreEditor",
        "Microsoft.VisualStudio.Workload.NativeDesktop",
        "Microsoft.VisualStudio.Component.VC.Tools.x86.x64"
    },
    lang = "zh-CN",
    mixin = {
        "--includeRecommended"
    },
    product = "Community",
    channel = "2022_rc",
    path = {
        install = [[D:\toolchain\Microsoft Visual Studio\2022\Community]],
        cache = [[D:\toolchain\Microsoft Visual Studio\2022\Cache]],
        shared = [[D:\toolchain\Microsoft Visual Studio\2022\Shared]]
    }
})
-- local cpm = import("cpm@1.0")
-- cpm.install({
--     lib = "libffi@3.17"
-- })
