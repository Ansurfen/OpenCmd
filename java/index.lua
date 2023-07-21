--  Copyright 2023 The OpenCmd Authors. All rights reserved.
--  Use of this source code is governed by a MIT-style
--  license that can be found in the LICENSE file.

return {
    dep_adapter = import("./util/dep_adapter"),
    java = import("./util/java"),
    javac = import("./util/javac"),
    jar = import("./util/jar"),
    manifest = import("./util/manifest")
}
