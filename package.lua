return {
    name = "code-nuage/potfolio",
    version = "0.0.1",
    description = "My personnal portfolio, available at eloi-hariot.fr",
    tags = { "lua", "lit", "luvit" },
    license = "MIT",
    author = { name = "code-nuage", email = "eloi.hariot@protonmail.com" },
    homepage = "https://github.com/code-nuage/portfolio",
    dependencies = {
        "code-nuage/direct-router",
        "code-nuage/direct-mime",
        "code-nuage/direct-publicize",
        "code-nuage/direct-verbosity"
    },
    files = {
        "**.lua",
        "!test*"
    }
}
