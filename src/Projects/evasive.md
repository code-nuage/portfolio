---
{
    "img": "/Assets/projects/evasive.png",
    "title": "evasive",
    "link": "https://www.github.com/code-nuage/evasive",
    "description": "A Lua / Teal web microframework",
    "date": "2025-11-04"
}
---
## What is evasive?
`evasive` is an HTTP microframework, built on top of lua-http.

My first attempt at building an HTTP router originated from a school project, and [root](https://www.github.com/code-nuage/root) was the result of it. I built it on top of luvit stack, and it already shipped with several useful features, and `uv` became a major advantage later in its development.

---

## Why replacing `root`?
However, [lit](https://luvit.io/install.html) is not the main package manager in the Lua environment niche, so building web applications on top of `luvit` quickly quickly became a painful experience.

I then decided to port [coro-*](https://bilal2453.github.io/coro-docs/) libraries to [Luarocks](https://luarocks.org/), that heavily rely on the luvit runtime so a lot of code had to be written again, something which I wanted to avoid.

---

## The result
`evasive` is written on [`lua-http`](https://luarocks.org/modules/daurnimator/http), that exposes a full-featured developer API for every HTTP/S and web requirements.

The result is an object-oriented web framework that features a simple and clean API, way closer to the protocol itself and its streams than [milua](https:///www.github.com/miguelmj/milua) or [mote](https://www.github.com/luanvil/mote). It is, however, keeping some high levels features, like query params handler and middlewares implementation.

