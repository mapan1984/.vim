### my .vim

#### 说明

我使用[Vundle](https://github.com/VundleVim/Vundle.vim)做插件管理，所以`plugin`目录没有作用，但我会把一些自己写的简单脚本按功能分类放在`plugin`中，把它们放在这主要是我不想让`.vimrc`超过300行(太乱了，而且不好修改)，而且在vim启动时会自动加载`plugin`中的脚本

`mydraft`中是未完成或暂时被抛弃的的脚本，如果想使用可以在`.vimrc`中加下面的语句(`xxx.vim`是脚本的名字)

    source ~/.vim/mydraft/xxx.vim

在.vim中新建目录`.undo`，`.tmp`，因为使用了`set undodir=~/.vim/.undo`和`set directory=~/.vim/.tmp`，来放置文件`*.un~`和`*.swp`文件(通常情况下禁止生成`*.swp`文件，但以防万一)

    cd ~/.vim
    mkdir .undo .tmp

#### 使用

我不觉得有人会用我的配置，毕竟每个人的习惯不同，只有自己亲自的配置才会用的习惯, but any way ...

克隆到本地

    git clone http://github.com/mapan1984/vimrc.git ~/.vim 

进入`.vim`目录，建立新目录`.undo`, `.tmp`

    cd ~/.vim 
    mkdir .undo .tmp

进行软链接`-s`(symbolic link)(可以使用`-f`删除原有的‘~/.vimrc’文件, **谨慎使用**) 

    ln -sf `pwd`/.vimrc ~/.vimrc

或直接硬链接(hard link)

    ln -f 'pwd'/.vimrc ~/.vimrc
