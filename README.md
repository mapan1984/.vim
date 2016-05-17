### my .vim

#### 说明

`plugin`中是一些自己写的简单脚本，把它们放在这主要是为了让`.vimrc`不会太乱，而且在vim启动时可以自动加载

`mydraft`中是未完成或暂时被抛弃的的脚本，如果想使用可以在`vimrc`中加

    source ~/.vim/mydraft/xxx.vim

`xxx.vim`是脚本的名字

#### 使用

克隆到本地

    git clone http://github.com/mapan1984/vimrc.git ~/.vim 
    cd ~/.vim 

进行软链接`-s`(可以使用`-f`删除原有的‘~/.vimrc’文件)

    ln -sf `pwd`/.vimrc ~/.vimrc
