#!/usr/bin/env bash

dir_doom="$HOME/dotfiles/doom-wads"
dir_iwad="$dir_doom/iwad"
dir_pwad="$dir_doom/pwad"
dir_soundfont="$dir_doom/soundfont"

iwad_doom_ultimate="$dir_iwad/doom1.wad"
iwad_doom_2="$dir_iwad/doom2.wad"
iwad_heretic="$dir_iwad/heretic.wad"
iwad_hexen="$dir_iwad/hexen.wad"
iwad_strife="$dir_iwad/strife.wad"

pwad_nerve="$dir_iwad/nerve.wad"
pwad_hexen_deathkings="$dir_iwad/hexen-deathkings.wad"
pwad_strife_voices="$dir_iwad/strife-voices.wad"

pwad_sigil="$dir_pwad/sigil.wad"
pwad_sigil_2="$dir_pwad/sigil2.wad"


function main {
  bin=""
  game=""
  iwad=""
  pwad=""
  deh=""

  case "$game" in
    doom | heretic | hexen | strife)
      bin="crispy-$game"
      ;;
    "")
      echo "Error: Missing sub command, please specify one of 'doom', 'heretic', 'hexen' or 'strife'."
      return 1
      ;;
    *)
      echo "Error: unsupported game '$game', try one of 'doom', 'heretic', 'hexen' or 'strife'." >&2
      return 1
      ;;
  esac

  case "$game" in
    doom)
      iwad="$iwad_doom_ultimate"
      ;;
    doom2)
      iwad="$iwad_doom_2"
      ;;
    heretic)
      iwad="$iwad_heretic"
      ;;
    hexen)
      iwad="$iwad_hexen"
      ;;
    strife)
      iwad="$iwad_strife"
      ;;
    *)
      iwad="$iwad_doom_2"
      ;;
  esac

  return 0
}

main "$@"
