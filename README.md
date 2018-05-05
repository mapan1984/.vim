# My Vim Configuration

## 1.Introduce

可能适合`C/C++`, `Python`, `JavaScript`, `Go`, `HTML/CSS`, `Markdown`等语言。

键盘映射及常用功能等见[wiki](https://github.com/mapan1984/.vim/wiki)。

## 2.Installation

克隆到本地，并进行一些准备

    $ git clone http://github.com/mapan1984/.vim.git ~/.vim
    $ cd ~/.vim
    $ ./install.sh

如果想使用`.utils`中的脚本，可以在`.vimrc`中加下面的语句(`xxx.vim`是脚本的名字)

    source ~/.vim/.utils/xxx.vim

## 3.Dependencies

* 为了使用`<c-s>`、`<c-q>`映射，在.bashrc中加入`stty -ixon`
* 下载[ag](https://github.com/ggreer/the_silver_searcher)
* 下载[ctags](https://ctags.io/)

## 4.Last

happy vimming（＾∀＾）
