#! /bin/bash

if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
  PS1='${debian_chroot:+($debian_chroot)}\u `[ $XDG_SESSION_TYPE = tty ] && echo :: || echo ⇰` '
fi

NEWLINE_BEFORE_PROMPT=yes
[ "$NEWLINE_BEFORE_PROMPT" = yes ] && PROMPT_COMMAND="PROMPT_COMMAND=echo"
unset NEWLINE_BEFORE_PROMPT

HISTCONTROL=ignoreboth
HISTFILE="/dev/null"
#HISTSIZE=1000
#HISTFILESIZE=2000
: '
ket :
%d = tanggal
%a = hari
%b = bulan
%Y = Tahun
%H = jam
%M = menit
%S = detik
'
HISTTIMEFORMAT="%a, %d %b %Y %H:%M:%S "

# enable color support
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias diff='diff --color=auto'
  alias dir='dir --color=auto'
  alias egrep='egrep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias grep='grep --color=auto'
  alias ip='ip --color=auto'
  alias ls='ls --color=auto'
  alias vdir='vdir --color=auto'
fi

# ALIAS START GNOME SESSION FROM TTY
if [ "$XDG_SESSION_TYPE" == "tty" ]; then
  if [ "$(command -v gnome-session)" ]; then
    alias start-gnome-session="XDG_SESSION_TYPE=wayland dbus-run-session gnome-session &>/dev/null"
  fi
fi

if [ "$XDG_SESSION_TYPE" != "tty" ]; then
  FILE_BASHRC_XXX="$HOME/.bashrc_xxx"
  if [ -f $FILE_BASHRC_XXX ]; then
    . $FILE_BASHRC_XXX
  fi
  unset FILE_BASHRC_XXX
fi