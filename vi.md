#进入vi的命令

vi filename :打开或新建文件，并将光标置于第一行首

vi +n filename ：打开文件，并将光标置于第n行首

vi + filename ：打开文件，并将光标置于最后一行首

vi +/pattern filename：打开文件，并将光标置于第一个与pattern匹配的串处

vi -r filename ：在上次正用vi编辑时发生系统崩溃，恢复filename

vi filename….filename ：打开多个文件，依次进行编辑

#移动光标类命令

Enter ：光标下移一行

w或W ：光标右移一个字至字首

b或B ：光标左移一个字至字首

e或E ：光标右移一个字至字尾

nG：光标移至第n行首

n+：光标下移n行

n-：光标上移n行

n$：光标移至第n行尾

H ：光标移至屏幕顶行

M ：光标移至屏幕中间行

L ：光标移至屏幕最后行

0：（注意是数字零）光标移至当前行首

$：光标移至当前行尾

#屏幕翻滚类命令

Ctrl+u：向文件首翻半屏

Ctrl+d：向文件尾翻半屏

Ctrl+f：向文件尾翻一屏

Ctrl＋b；向文件首翻一屏

nz：将第n行滚至屏幕顶部，不指定n时将当前行滚至屏幕顶部。

#插入文本类命令

i ：在光标前

I ：在当前行首

a：光标后

A：在当前行尾

o：在当前行之下新开一行

O：在当前行之上新开一行

r：替换当前字符

#删除命令

ndw或ndW：删除光标处开始及其后的n-1个字

d0：删至行首

d$：删至行尾

ndd：删除当前行及其后n-1行

x或X：删除一个字符，x删除光标后的，而X删除光标前的

#搜索及替换命令

/pattern：从光标开始处向文件尾搜索pattern

?pattern：从光标开始处向文件首搜索pattern

n：在同一方向重复上一次搜索命令

N：在反方向上重复上一次搜索命令

：s/p1/p2/g：将当前行中所有p1均用p2替代

：n1,n2s/p1/p2/g：将第n1至n2行中所有p1均用p2替代

：g/p1/s//p2/g：将文件中所有p1均用p2替换 <=> %s/p1/p2/g

#行方式命令

：n1,n2 co n3：将n1行到n2行之间的内容拷贝到第n3行下

：n1,n2 m n3：将n1行到n2行之间的内容移至到第n3行下

：n1,n2 d ：将n1行到n2行之间的内容删除

：w ：保存当前文件

：e filename：打开文件filename进行编辑

：x：保存当前文件并退出

：q：退出vi

：q!：不保存文件并退出vi

：!command：执行shell命令command

：n1,n2 w!command：将文件中n1行至n2行的内容作为command的输入并执行之，若不指定n1，n2，则表示将整个文件内容作为command的输入

：r!command：将命令command的输出结果放到当前行

#寄存器操作

“?nyy：将当前行及其下n行的内容保存到寄存器？中，其中?为一个字母，n为一个数字

“?nyw：将当前行及其下n个字保存到寄存器？中，其中?为一个字母，n为一个数字

“?nyl：将当前行及其下n个字符保存到寄存器？中，其中?为一个字母，n为一个数字

“?p：取出寄存器？中的内容并将其放到光标位置处。这里？可以是一个字母，也可以是一个数字

ndd：将当前行及其下共n行文本删除，并将所删内容放到1号删除寄存器中。


#vim 配置文件：

yum -y install vim-enhanced
Options ->Session Options -> Terminal -> Emulation 中Terminal选择ANSI or linux or xterm,必须钩上 ANSI Colour 和 use color scheme

syntax on 语法高亮

set nu 显示行号

hi Comment ctermfg=DarkCyan 修改默认注释颜色

filetype on 侦测文件类型

filetype plugin on 载入文件类型插件

filetype indent on 为特定文件类型载入相关缩进文件

filetype indent plugin on

set hlsearch 设置高亮搜索

set incsearch 在搜索时，输入的词句的逐字符高亮


set showmatch 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号

set laststatus=2 总是显示状态行

set wildmenu 增强模式中的命令行自动完成操作

