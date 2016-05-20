### my .vim

#### 说明

我使用[Vundle](https://github.com/VundleVim/Vundle.vim)做插件管理(每个插件都在`bundle`下的单独文件夹中)，所以`plugin`目录是空的用，但我会把一些自己写的简单脚本按功能分类放在`plugin`中，把它们放在这主要是我不想让`.vimrc`超过300行(太乱了，而且不好修改)，在vim启动时会自动加载`plugin`中的脚本

`ftplugin`目录下的文件是否执行取决于文件的名字，当Vim把一个缓冲区的`filetype`设置成某个值时，它会去查找`~/.vim/ftplugin/`下的文件, 比如: 如果你执行`set filetype=derp`，Vim将查找`~/.vim/ftplugin/derp.vim`。 一旦文件存在，Vim将执行它(相当于设置`autocmd filetype derp xxxx`)。

Vim也支持在`~/.vim/ftplugin/`下放置文件夹(以我们刚才的例子为例: `set filetype=derp`将告诉Vim去执行`~/.vim/ftplugin/derp/`下的全部`*.vim`文件。 这使得你可以按代码逻辑分割在`ftplugin下`的文件)

因为每次在一个缓冲区中执行`filetype`时都会执行这些文件，所以它们只能设置`buffer-local`选项！ 如果在它们中设置了全局选项，所有打开的缓冲区的设置都会遭到覆盖！

`mydraft`中是未完成或暂时被抛弃的的脚本，如果想使用可以在`.vimrc`中加下面的语句(`xxx.vim`是脚本的名字)

    source ~/.vim/mydraft/xxx.vim

在.vim中新建目录`.undo`，`.tmp`，因为使用了`set undodir=~/.vim/.undo`和`set directory=~/.vim/.tmp`，来放置文件`*.un~`和`*.swp`文件(通常情况下禁止生成`*.swp`文件，但以防万一)

    cd ~/.vim
    mkdir .undo .tmp

#### 安装

我不觉得有人会用我的配置，毕竟每个人的习惯不同，只有自己亲自的配置才会用的习惯, but anyway ...

克隆到本地

    git clone http://github.com/mapan1984/vimrc.git ~/.vim 

进入`.vim`目录，建立新目录`.undo`, `.tmp`

    cd ~/.vim 
    mkdir .undo .tmp

进行软链接`-s`(symbolic link)(可以使用`-f`删除原有的‘~/.vimrc’文件, **谨慎使用**) 

    ln -sf `pwd`/.vimrc ~/.vimrc

或直接硬链接(hard link)

    ln -f 'pwd'/.vimrc ~/.vimrc

#### 最后

happy vimming（＾∀＾）
