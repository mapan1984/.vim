#!/bin/bash

printf "\033[33mInstall Start...\033[0m\n\n"

printf "\033[36mChecking Git install...\033[0m\n"
hash git 2>/dev/null || { echo >&2 "Require Git is not installed! Please install Git before you prefix config vim"; exit 1; }
git --version
printf "\033[36mChecking Git Completed!\033[0m\n\n"

printf "\033[34mChecking Dir ...\033[0m\n"
if [ ! -d "$HOME/.vim" ]; then
  echo "Make ALL with $HOME Directory PATH"
  printf "\n"
  echo " [- .vim"
  echo "   |- bundle   [ -- Manager Plugin -- ]"
  echo "   |- autoload [ -- Manager Plugin -- ]"
  echo "   |- .undo    [ -- Generator undo file -- ]"
  echo "   |- .tmp     [ -- Generator tmp file -- ]"
  echo " -] "
  printf "\n"

  mkdir $HOME/.vim
  mkdir $HOME/.vim/bundle
  mkdir $HOME/.vim/.undo
  mkdir $HOME/.vim/.tmp
  mkdir $HOME/.vim/autoload
else
  if [ ! -d "$HOME/.vim/bundle" ]; then
    echo "Make dir -- bundle"
    mkdir $HOME/.vim/bundle
  fi
  if [ ! -d "$HOME/.vim/autoload/" ]; then
    echo "Make dir -- [ autoload ]"
    mkdir $HOME/.vim/autoload/
  fi
  if [ ! -d "$HOME/.vim/.undo" ]; then
    echo "Make dir -- [ .undo ]"
    mkdir $HOME/.vim/.undo
  fi
  if [ ! -d "$HOME/.vim/.tmp" ]; then
    echo "Make dir -- [ .tmp ]"
    mkdir $HOME/.vim/.tmp
  fi
fi
printf "\033[34mChecking Dir Completed!\033[0m\n\n"

printf "\033[36mChecking plug.vim Exist?\033[0m\n"
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  echo "Download Vim-Plug Plugin..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
printf "\033[36mChecking plug.vim Completed!\033[0m\n\n"

printf "\033[32mCopy .vimrc to the HOME PATH...\033[0m\n"
echo " [- $HOME/"
echo "   |- .vimrc       [ -- Vim config -- ]"
echo " -] "
# Copy file in to path
#cp -f .vimrc $HOME/
ln -f .vimrc ~/.vimrc
printf "\033[32mCopy Completed\033[0m\n\n"

printf "\033[36mInstall plug...\033[0m\n"
vim +PlugInstall +qall
printf "\033[36mInstall plug Completed!\033[0m\n\n"


printf "\033[33mInstall Completed!\033[0m\n"
exit 0;
