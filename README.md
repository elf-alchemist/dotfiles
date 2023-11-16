# The Alchemist's Lab
```

These be me workshop tools, and mine only shall be.

```
## Homebrew
The undeniable great of POSIX package management, compatible with both MacOS and Linux.
Though it has it's caveats, and minutia of problems here and there, it has become a tool
like few others, since Mac has not it's own package management, and Linux is all
over the place, considering it's various different interfaces (`dpkg` and `apt` are still the best).
It has become the core of my scripts, my dotfiles.

## Visual Studio Code - Vim - Neovim
I believe it is somewhat self explanatory, `vim` is great, `neovim` is great,
`tmux` is great, and I love the command line, but the skill floor, in my particular situation,
is much lower for me in `VSCode`, I can a whole lot more with less effort, for now at least,
compared to the classic Unix editor. I will still use it for simple and minor editing
on the terminal, but for my daily tasks, focused mostly on `JavaScript` web dev and the such,
it is just simpler for me to use `VSCode`, for now atleast, until I master `Vim`.

## Node, PNPM
Plain and simple, the way I like it, `Deno` is really nice, `Bun` is really good, but `Node` is
where everything started and, as of yet, where it stays. Thankfully, modern versions
of JavaScript are actually somewhat decent, if you care to to commit cognitive dissonance,
where deprecated APIs, old standard libraries, and legacy code are concerned. Although,
at the end of it all, `node_modules` is still denser than a black hole, so here comes
the beaultiful second part, `PNPM`, a tool that is significantly smarter than `NPM`.
It manages to be not only faster to download but also stores all packages globally in your machine,
and then, since they are cached, symlinks everything that is already downloaded, saving the
poor developer, gigabytes of space, which, otherwise, would go overpopulated with duplicate
packages. Even if your total repository count in your own machine may be small, there is no known
downside to just using `PNPM` over `NPM`.
