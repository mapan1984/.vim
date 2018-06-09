#!/usr/bin/env bash

debug_mode='0'

function msg() {
  printf '%b\n' "$1" >&2
}

function info() {
  msg "\33[36m[>]\33[0m ${1}${2}"
}

function success() {
  msg "\33[32m[✔]\33[0m ${1}${2}"
}

function waring() {
  msg "\33[33m[!]\33[0m ${1}${2}"
}

function error() {
  msg "\33[31m[✘]\33[0m ${1}${2}"
  exit 1
}

function debug() {
  if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
    msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
  fi
}

function program_exists() {
  local ret='0'
  command -v $1 >/dev/null 2>&1 || { local ret='1'; }

  # fail on non-zero return value
  if [ "$ret" -ne 0 ]; then
    return 1
  fi

  return 0
}

function variable_must_set() {
  if [ -z "$1" ]; then
    error "You must have your $1 environmental variable set to continue."
  fi
}

function lnif() {
  if [ -e "$1" ]; then
    ln -sf "$1" "$2"
  fi
  ret="$?"
  debug
}

function check_must_program() {
  local program="$1"
  program_exists ${program}
  if [[ "$?" -ne 0 ]]; then
    error "You must have ${program} installed to continue."
  else
    success "You have installed ${program}."
  fi
}

function check_option_program() {
  local program="$1"
  program_exists ${program}
  if [[ "$?" -ne 0 ]]; then
    waring "Install ${program} to get a better experience."
  else
    success "You have installed ${program}."
  fi

}

function setup_plugs() {
  info "Install all vim plugs ..."

  local system_shell="$SHELL"
  export SHELL='/bin/sh'

  # Check(and install) plug.vim
  if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ret="$?"
    if [[ "$ret" -eq '0' ]]; then
      success "Install plug.vim done."
    fi
    debug
  fi

  # Install all plugs
  vim +PlugInstall +qall

  export SHELL="$system_shell"

  ret="$?"
  if [[ "$ret" -eq '0' ]]; then
    success "Install all vim plugs done."
  fi
  debug
}

info "Install start ..."

check_must_program "vim"
check_must_program "git"
check_option_program "ag"
check_option_program "ctags"

setup_plugs

info "Install Completed!"
