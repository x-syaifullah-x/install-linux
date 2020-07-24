#! /bin/bash

# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Correct the command if there is a typo
shopt -s cdspell

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
# but only if not SUDOing and have SUDO_PS1 set; then assume smart user.
if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
  PS1='${debian_chroot:+($debian_chroot)}\u `[ $XDG_SESSION_TYPE = tty ] && echo :: || echo ⇰` '
fi

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

NEWLINE_BEFORE_PROMPT=yes
[ "$NEWLINE_BEFORE_PROMPT" = yes ] && PROMPT_COMMAND="PROMPT_COMMAND=echo"
unset NEWLINE_BEFORE_PROMPT

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# HISTFILE="/dev/null"
# HISTSIZE=1000
# HISTFILESIZE=2000
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

# enable color support of ls, less and man, and also add handy aliases
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

  #export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
  #export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
  #export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
  #export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
  #export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
  #export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
  #export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
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