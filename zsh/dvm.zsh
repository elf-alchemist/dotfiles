#compdef dvm

autoload -U is-at-least

_dvm() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
":: :_dvm_commands" \
"*::: :->dvm" \
&& ret=0
    case $state in
    (dvm)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:dvm-command-$line[1]:"
        case $line[1] in
            (completions)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
':shell:(bash elvish fish powershell zsh)' \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
&& ret=0
;;
(install)
_arguments "${_arguments_options[@]}" \
'--no-use[Only install to local, but not use]' \
'-h[Print help information]' \
'--help[Print help information]' \
'::version -- The version to install:' \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
&& ret=0
;;
(list-remote)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
&& ret=0
;;
(uninstall)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'::version -- The version to install:' \
&& ret=0
;;
(use)
_arguments "${_arguments_options[@]}" \
'-l[Writing the version to the .dvmrc file of the current directory if present]' \
'--local[Writing the version to the .dvmrc file of the current directory if present]' \
'-h[Print help information]' \
'--help[Print help information]' \
'::version -- The version, semver range or alias to use:' \
&& ret=0
;;
(alias)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
":: :_dvm__alias_commands" \
"*::: :->alias" \
&& ret=0

    case $state in
    (alias)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:dvm-alias-command-$line[1]:"
        case $line[1] in
            (set)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
':name -- Alias name to set:' \
':content -- Alias content:' \
&& ret=0
;;
(unset)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
':name -- Alias name to unset:' \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
'*::subcommand -- The subcommand whose help message to display:' \
&& ret=0
;;
        esac
    ;;
esac
;;
(activate)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
&& ret=0
;;
(deactivate)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
&& ret=0
;;
(doctor)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
&& ret=0
;;
(upgrade)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
'::alias -- The alias to upgrade, upgrade all aliases if not present:' \
&& ret=0
;;
(exec)
_arguments "${_arguments_options[@]}" \
'-d+[The version to use]:DENO_VERSION: ' \
'--deno-version=[The version to use]:DENO_VERSION: ' \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
'::command -- The command given to deno:' \
&& ret=0
;;
(clean)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
&& ret=0
;;
(registry)
_arguments "${_arguments_options[@]}" \
'-h[Print help information]' \
'--help[Print help information]' \
'-V[Print version information]' \
'--version[Print version information]' \
'::registry -- The registry to be set, `official`, `cn`, or url you desired:' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
'*::subcommand -- The subcommand whose help message to display:' \
&& ret=0
;;
        esac
    ;;
esac
}

(( $+functions[_dvm_commands] )) ||
_dvm_commands() {
    local commands; commands=(
'completions:Generate shell completions' \
'info:Show dvm info.' \
'install:Install deno executable to the given version.' \
'i:Install deno executable to the given version.' \
'add:Install deno executable to the given version.' \
'list:List all installed versions' \
'ls:List all installed versions' \
'll:List all installed versions' \
'la:List all installed versions' \
'list-remote:List all released versions' \
'lr:List all released versions' \
'ls-remote:List all released versions' \
'uninstall:Uninstall a given version' \
'un:Uninstall a given version' \
'unlink:Uninstall a given version' \
'rm:Uninstall a given version' \
'remove:Uninstall a given version' \
'use:Use a given version or a semver range or a alias to the range.' \
'alias:Set or unset an alias' \
'activate:Activate Dvm' \
'deactivate:Deactivate Dvm' \
'doctor:Fixing dvm specific environment variables and other issues' \
'upgrade:Upgrade aliases to the latest version' \
'exec:Execute deno command with a specific deno version' \
'clean:Clean dvm cache' \
'registry:Change registry that dvm fetch from' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'dvm commands' commands "$@"
}
(( $+functions[_dvm__activate_commands] )) ||
_dvm__activate_commands() {
    local commands; commands=()
    _describe -t commands 'dvm activate commands' commands "$@"
}
(( $+functions[_dvm__alias_commands] )) ||
_dvm__alias_commands() {
    local commands; commands=(
'set:Set an alias' \
'unset:Unset an alias' \
'list:List all aliases' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'dvm alias commands' commands "$@"
}
(( $+functions[_dvm__clean_commands] )) ||
_dvm__clean_commands() {
    local commands; commands=()
    _describe -t commands 'dvm clean commands' commands "$@"
}
(( $+functions[_dvm__completions_commands] )) ||
_dvm__completions_commands() {
    local commands; commands=()
    _describe -t commands 'dvm completions commands' commands "$@"
}
(( $+functions[_dvm__deactivate_commands] )) ||
_dvm__deactivate_commands() {
    local commands; commands=()
    _describe -t commands 'dvm deactivate commands' commands "$@"
}
(( $+functions[_dvm__doctor_commands] )) ||
_dvm__doctor_commands() {
    local commands; commands=()
    _describe -t commands 'dvm doctor commands' commands "$@"
}
(( $+functions[_dvm__exec_commands] )) ||
_dvm__exec_commands() {
    local commands; commands=()
    _describe -t commands 'dvm exec commands' commands "$@"
}
(( $+functions[_dvm__alias__help_commands] )) ||
_dvm__alias__help_commands() {
    local commands; commands=()
    _describe -t commands 'dvm alias help commands' commands "$@"
}
(( $+functions[_dvm__help_commands] )) ||
_dvm__help_commands() {
    local commands; commands=()
    _describe -t commands 'dvm help commands' commands "$@"
}
(( $+functions[_dvm__info_commands] )) ||
_dvm__info_commands() {
    local commands; commands=()
    _describe -t commands 'dvm info commands' commands "$@"
}
(( $+functions[_dvm__install_commands] )) ||
_dvm__install_commands() {
    local commands; commands=()
    _describe -t commands 'dvm install commands' commands "$@"
}
(( $+functions[_dvm__alias__list_commands] )) ||
_dvm__alias__list_commands() {
    local commands; commands=()
    _describe -t commands 'dvm alias list commands' commands "$@"
}
(( $+functions[_dvm__list_commands] )) ||
_dvm__list_commands() {
    local commands; commands=()
    _describe -t commands 'dvm list commands' commands "$@"
}
(( $+functions[_dvm__list-remote_commands] )) ||
_dvm__list-remote_commands() {
    local commands; commands=()
    _describe -t commands 'dvm list-remote commands' commands "$@"
}
(( $+functions[_dvm__registry_commands] )) ||
_dvm__registry_commands() {
    local commands; commands=()
    _describe -t commands 'dvm registry commands' commands "$@"
}
(( $+functions[_dvm__alias__set_commands] )) ||
_dvm__alias__set_commands() {
    local commands; commands=()
    _describe -t commands 'dvm alias set commands' commands "$@"
}
(( $+functions[_dvm__uninstall_commands] )) ||
_dvm__uninstall_commands() {
    local commands; commands=()
    _describe -t commands 'dvm uninstall commands' commands "$@"
}
(( $+functions[_dvm__alias__unset_commands] )) ||
_dvm__alias__unset_commands() {
    local commands; commands=()
    _describe -t commands 'dvm alias unset commands' commands "$@"
}
(( $+functions[_dvm__upgrade_commands] )) ||
_dvm__upgrade_commands() {
    local commands; commands=()
    _describe -t commands 'dvm upgrade commands' commands "$@"
}
(( $+functions[_dvm__use_commands] )) ||
_dvm__use_commands() {
    local commands; commands=()
    _describe -t commands 'dvm use commands' commands "$@"
}

_dvm "$@"
