#!/usr/bin/env bash

source "${HOME}/dotfiles/bin/bashrc"

source "${HOME}/dotfiles/bin/esrc"

if command -v brew &> /dev/null; then
	source "${HOME}/dotfiles/bin/brewrc"
fi

. "$HOME/.cargo/env"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/alchemist/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/alchemist/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
# >>> xmake >>>
test -f "/home/alchemist/.xmake/profile" && source "/home/alchemist/.xmake/profile"
# <<< xmake <<<
