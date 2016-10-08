# My Vim Configuration

1. [Manual](#user-content-1manual)
2. [Installation](#user-content-2installation)
3. [Manage](#user-content-3Manage)
4. [Last](#user-content-4last)

## 1.Manual

因为我使用[Vundle](https://github.com/VundleVim/Vundle.vim)做插件管理(每个插件都在`bundle`下的单独文件夹中)，所以`.vim`下的目录都是空的,但我会把一些自己写的简单脚本按功能分类放在这些目录中，把它们放在这主要是我不想让`.vimrc`超过300行(太乱了，而且不好修改)，而且分配好之后在vim启动时会自动(或按需)加载这些脚本，十分方便。以下为目录说明:

* `plugin`目录下是一些执行基本通用功能的脚本，在`.vimrc`中有功能明确相关且代码较长的代码块时，我就会把它们放在这。在`plugin`目录下的文件会在Vim启动时自动加载。
* `ftplugin`目录下的文件是否执行取决于文件的名字，当Vim把一个缓冲区的`filetype`设置成某个值时，它会去查找`~/.vim/ftplugin/`下的文件, 比如: 如果你执行`set filetype=derp`，Vim将查找`~/.vim/ftplugin/derp.vim`。 一旦文件存在，Vim将执行它(相当于设置`autocmd filetype derp xxxxx`)。
* `indent`目录与`ftplugin`目录相似，都会按`filetype`自动加载，这里有我在[vim.org](http://www.vim.org)找的脚本，优化对代码缩进的支持。
* `syntax`目录与`ftplugin`目录相似，都会按`filetype`自动加载，这里有我在[vim.org](http://www.vim.org)找的脚本，优化对代码语法的支持。
* `mydraft`中是未完成或暂时被抛弃的的脚本

## 2.Installation

我不觉得有人会用我的配置，毕竟每个人的习惯不同，只有自己亲自的配置才会用的习惯, but anyway ...

克隆到本地

    $ git clone http://github.com/mapan1984/.vim.git ~/.vim 

进行软链接`-s`(symbolic link)(可以使用`-f`删除原有的`~/.vimrc`文件, **谨慎使用**) 

    $ cd ~/.vim
    $ ln -sf .vimrc ~/.vimrc

或直接硬链接(hard link)

    $ ln -f .vimrc ~/.vimrc

下载vundle

    $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

打开vim，执行

    :PluginInstall!

在`.vim`目录中新建`.undo`和`.tmp`目录，因为使用了`set undodir=~/.vim/.undo`和`set directory=~/.vim/.tmp`，来放置文件`*.un~`和`*.swp`文件(通常情况下禁止生成`*.swp`文件，但以防万一)

    $ cd ~/.vim
    $ mkdir .undo .tmp

如果想使用`mydraft`中的脚本，可以在`.vimrc`中加下面的语句(`xxx.vim`是脚本的名字)

    source ~/.vim/mydraft/xxx.vim

## 3.Manage

### 3.1 可以使用[Installation](#user-content-2installation)

### 3.2 Try using git submodule manage vim plugin

将每一个插件作为一个子模块，用git submodule管理

    $ cd ~/.vim
    $ git submodule add https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 

克隆仓库并抓取子模块：

    $ git clone http://github.com/mapan1984/.vim.git ~/.vim
    $ git submodule init
    $ git submodule update

也可以自动初始化并更新每一个子模块：

    $ git clone --recursive http://github.com/mapan1984/.vim.git ~/.vim 

## 4.Last

happy vimming（＾∀＾）
