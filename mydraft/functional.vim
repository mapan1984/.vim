" 一些对函数式编程的支持函数

" 创建list的副本，为了排序时不改变原list
function! Sorted(list)
    let new_list = deepcopy(a:list)
    call sort(new_list)
    return new_list
endfunction

function! Reversed(list)
    let new_list = deepcopy(a:list)
    call reverse(new_list)
    return new_list
endfunction

function! Append(list, val)
    let new_list = deepcopy(a:list)
    call add(new_list, a:val)
    return new_list
endfunction

function! Assoc(list, i, val)
    let new_list = deepcopy(a:list)
    let new_list[a:i] = a:val
    return new_list
endfunction

function! Pop(list, i)
    let new_list = deepcopy(a:list)
    call remove(new_list, a:i)
    return new_list
endfunction

"Mapped()接受两个参数：
    "一个funcref("储存一个函数的变量"在Vim里的说法) 比如:function("Reversed")
    "一个列表
function! Mapped(fn, list)
    let new_list = deepcopy(a:list)
    call map(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

"Filtered()接受一个谓词函数和一个列表
"它返回一个列表的副本， 而这个列表只包括将自身作为谓词函数的输入参数并返回真值的元素 
function! Filtered(fn, l)
    let new_list = deepcopy(a:l)
    call filter(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

"Removed()就像Filtered()，不过它只保留谓词函数返回非真值的元素
"代码中的唯一不同在于调用命令前面的'!' .，它把谓词函数的结果取反
function! Removed(fn, l)
    let new_list = deepcopy(a:l)
    call filter(new_list, '!' . string(a:fn) . '(v:val)')
    return new_list
endfunction
