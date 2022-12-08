# the alkemist's bashrc addition to debian's default

# runtime and tools
export EDITOR="/bin/vim"
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# git related; prompt, and git ignore;
source "$HOME/code/lambda-alchemist/git.bash"
PS1='\[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 " (%s)") → '
function gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}
