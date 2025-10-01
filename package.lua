return {
    name = "code-nuage/portfolio",
    version = "0.0.1",
    description = "",
    tags = { "lua", "lit", "luvit" },
    license = "MIT",
    author = { name = "code-nuage", email = "eloi.hariot@protonmail.com" },
    homepage = "https://github.com/code-nuage/portfolio",
    dependencies = {
        "luvit/coro-http",
        "luvit/coro-fs"
    },
    files = {
        "**.lua",
        "!test*"
    }
}
