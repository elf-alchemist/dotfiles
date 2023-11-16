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

## Docker
A fine tool for many, and for me too, Docker is very simple, containers, that's it.
Sharing the same environemnt across develoeprs is great, mostly making it possible to
scream in anger when hearing the phrase: "It works on my machine", though it does
require a whole Virtual Machine on Mac via `Docker Desktop`, it's still worth the expense.
Not much else to say here.

## Cloud
Ah yes, `The Cloud ™` the biggest buzzword in tech since OOP first became a thing, a tiresome
platform where the Amazon, Google and Microsoft are the only real winners, a platform so misunderstood,
that millions of dollars are lost on it, for no reason other than customers being told: "It's cheaper" and
"It's easier". Not that they can't be more economical, whne compared to on-premises infrastructure or
that `serverless` can't cheaper that `serverful` in some comparisons, it all depends on the context, and
correct math, but who has time for mathematics, right? Well after all that, and then some,
I only really have `google-cloud-sdk`, and `aws-sam-cli` to work with, since my day job really doesn't ask
for anything else, this is just about enough for me, but if my job didn't ask for it,
I would only really use `Cloudflare Wrangler`.
