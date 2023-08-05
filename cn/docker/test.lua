--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

local cmdparse = import("../../util/cmdparse")

local res = cmdparse(
    "docker run -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql:8.0.20", {
        ["-p"] = flag_type.str,
        ["-e"] = flag_type.arr,
        ["-d"] = flag_type.str,
        ["--name"] = flag_type.str,
    })
print(res["-d"])
