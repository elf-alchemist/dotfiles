# The Alchemist's Lab
Base project containing all my settings for Linux and MacOS systems.
As well as personal projects as Git submodules, for my convenience.

## Setup
When on a freshly installed sytem, clone to $HOME and install Homebrew:
```sh
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Homebrew
To install all Homebrew packages, run:
```sh
# If on Linux
$ make brew_install_linux
# If on MacOS
$ make brew_install_darwin
```

Now, you will always have up-to-date binaries for the base system.
This includes manycli tools, such as: coreutils, bash, awk, git,
neovim, emacs, docker, et cetera, et cetera.

### Bash and Tmux
After installing the base Homebrew packages, setup the `bash` binary and `tmux`:
```sh
$ make setup_shell
$ make setup_tmux
```
