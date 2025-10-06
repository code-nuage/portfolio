return {
    name = "portfolio",
    version = "0.0.1",
    description = "code-nuagee portfolio",
    tags = { "lua", "lit", "luvit" },
    license = "MIT",
    author = { name = "code-nuage", email = "eloi.hariot@protonmail.com" },
    homepage = "https://github.com/portfolio",
    dependencies = {
        "code-nuage/direct",
        "luvit/json"
    },
    files = {
        "**.lua",
        "!test*"
    }
}
