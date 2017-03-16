# My Vim Configuration

1. [Manual](#user-content-1manual)
2. [Installation](#user-content-2installation)
3. [Manage](#user-content-3manage)
4. [Dependencies](#user-content-4dependencies)
5. [Last](#user-content-5last)

## 1.Manual

因为我使用[vim-plug](https://github.com/junegunn/vim-plug)管理插件(每个插件都在`bundle`下的单独文件夹中)，所以`.vim`下的目录都是空的，但我会把一些自己写的简单脚本按功能分类放在这些目录中。把它们放在这主要是我不想让`.vimrc`过长(不好修改)，将每个功能分在不同的文件中更加便于修改，而且分配好之后在Vim启动时会自动(或按需)加载这些脚本，十分方便。以下为目录说明:

1. 自动加载：
    * `.vimrc`
    * `ftdetect`
    * `plugin`目录下是一些执行基本通用功能的脚本，在`.vimrc`中有功能明确相关且代码较长的代码块时，我就会把它们放在这。在`plugin`目录下的文件会在Vim启动时自动加载。
2. 按文件类型自动加载
    * `ftplugin`目录下的文件是否执行取决于文件的名字，当Vim把一个缓冲区的`filetype`设置成某个值时，它会去查找`~/.vim/ftplugin/`下的文件, 比如: 如果你执行`set filetype=derp`，Vim将查找`~/.vim/ftplugin/derp.vim`。 一旦文件存在，Vim将执行它(相当于设置`autocmd filetype derp xxxxx`)。
    * `indent`
    * `syntax`
3. 有需要时加载
    * `autoload`目录下的文件会在调用其中函数是加载
        * ci.vim可以支持在vim中翻译英文单词
        * comment.vim提供了方便的注释方式
        * compile.vim提供了对源代码的一键编译
        * format.vim提供了格式控制
4. 其他文件
    * `.draft`中是未完成或暂时被抛弃的的脚本
    * `.undo`: `set undodir=~/.vim/.undo`
    * `.tmp`: `set directory=~/.vim/.tmp`

## 2.Installation

克隆到本地，并进行一些准备

    $ git clone http://github.com/mapan1984/.vim.git ~/.vim
    $ cd ~/.vim
    $ ./install.sh

如果想使用`.draft`中的脚本，可以在`.vimrc`中加下面的语句(`xxx.vim`是脚本的名字)

    source ~/.vim/.draft/xxx.vim

## 4.Dependencies

* 为了使用`<c-s>`、`<c-q>`映射，在.bashrc中加入`stty -ixon`
* 下载clang-format.py到.draft文件夹中

## 5.Last

happy vimming（＾∀＾）
