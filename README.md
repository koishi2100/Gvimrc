
# Gvim92/acm

> 本项目配置定位清晰，主要用于个人算法竞赛，上传至 Github 仓库留作备份（Windowss 版本）。目前写的很狗屎，仍有许多地方不完善，有机会再重写。。。



**有关为什么我会选用 Vim，而不是其它主流编辑器如 VSCode？**

1. 敲起来爽。
2. 轻量快速：打开任何文件秒启动，占用内存仅几十 MB，再差的配置也能启动。对比其它编辑器，启动慢，占用内存动不动就几百 MB 甚至几 G。
3. 存储空间低：精简/压缩后的 Vim 占用空间只有几 MB，可以快速在设备之间拷贝。
4. 开箱即用：下载完直接解压就能用，且保留配置文件，无需二次配置。
5. 开源免费跨平台：支持 Linux、MacOS、Windows，也可以在手机/平板运行（有一个终端就行）。
6. 输入效率高：全键盘操作熟练后，可以专注于实现算法本身，思路基本不会被输入打断。
7. 可高度定制化：社区有大量插件可以使用，也可以自己写。
8. ......

当然，对于日常写工程代码使用 VSCode、CLion 等专业软件确实更合适（除非你是大佬另说...）。





 Vim 配置文件集，位于 `$VIMRUNTIME/acm`，由 `_vimrc` 统一加载：

```vim
source $VIMRUNTIME/acm/theme.vim
source $VIMRUNTIME/acm/common.vim
source $VIMRUNTIME/acm/keymap.vim
source $VIMRUNTIME/acm/plugged.vim
source $VIMRUNTIME/acm/programming.vim
source $VIMRUNTIME/acm/macm.vim
```



## 目录结构

```
acm/
├── theme.vim            # GUI 外观与基础显示设置
├── common.vim           # 通用编辑设置（缩进/历史/自动读写等）
├── keymap.vim           # 按键映射与括号自动补全
├── plugged.vim          # 插件管理（vim-plug）与插件配置
├── programming.vim      # 按文件类型加载语言配置
├── macm.vim             # ACM 模板/常用缩写（iabbrev）
├── lang/                # 各语言配置文件
│   ├── c/       c.vim
│   ├── cpp/     cpp.vim      # C++ 编译运行、in/out 文件管理
│   ├── html/    html.vim     # F5 浏览器打开
│   ├── java/    java.vim
│   └── python/  python.vim   # Python 运行、in/out 文件管理
├── template/            # 算法模板（m-*.cpp）与字典补全
└── vimswapfiles/        # swap / undo / backup 文件存放目录
```



## 功能说明

> 以下配置均为个人偏好，用于网络赛、个人练习。



### theme.vim — 外观
- 字体 `consolas:h14`，窗口大小 110x38，位置 (300, 200)
- 语法高亮、搜索高亮、`showcmd`、`termguicolors`
- 关闭铃音、图形按钮（`set go=`）、标签页按需显示



### common.vim — 通用
- `ts=4 / shiftwidth=4 / smarttab / smartindent / cindent / autoindent`
- 历史记录 1000 条、`autowriteall`、`autoread`、`fileformat=unix`
- 菜单/消息强制英文（`language messages en_US`）
- swap/undo/backup 统一存放到 `vimswapfiles/` 下，并关闭 `swapfile` 与 `backup`



### keymap.vim — 按键映射

| 模式 | 按键 | 功能 |
| --- | --- | --- |
| insert | `jk` | 退出插入模式（Esc） |
| insert | `Ctrl+h/j/k/l` | 左/下/上/右移动光标 |
| insert | `Ctrl+f` / `Ctrl+g` | 退格删除 |
| insert | `Ctrl+z` | 撤销 |
| insert | `Shift+Backspace` | 删除整词 |
| normal | `Space` | 进入命令行 `:` |
| normal | `Ctrl+h/j/k/l` | 在窗口间切换 |
| normal / visual | `Ctrl+a` | 全选 |
| visual | `Ctrl+c` | 复制到系统剪贴板 |
| normal | `Shift+j/k` | 快速下/上移动 5 行 |
| visual | `Space` | 退出可视模式 |



括号自动补全（insert 模式）：

- `(` `{` `[` 自动配对，`)` `}` `]` 自动跳过已存在的右括号
- `Backspace` 一键删除成对括号（如 `()`、`{}`、`[]`）
- `Enter` 在 `{` 块内自动缩进换行
- 可视模式 `g( g{ g[ g" g'` 为选中内容加括号/引号



### plugged.vim — 插件
使用 [vim-plug](https://github.com/junegunn/vim-plug)，插件安装到 `$VIMRUNTIME/plugged`：

| 插件 | 用途 |
| --- | --- |
| `w0rp/ale` | 异步语法检查（C/C++/Python/Java） |
| `junegunn/seoul256.vim` | 主题（默认 dark） |
| `vim-airline/vim-airline` | 状态栏 |
| `vim-airline/vim-airline-themes` | airline 主题（solarized） |
| `scrooloose/nerdtree` | 文件树，`F3` 开关，宽度 25 |
| `luochen1990/rainbow` | 彩虹括号 |
| `octol/vim-cpp-enhanced-highlight` | C++ 增强高亮 |

常用命令：`:PlugInstall` 安装 / `:PlugStatus` 状态 / `:PlugUpdate` 更新。

关键配置：
- ALE：`g++` 参数 `-std=c++17 -O2 -Wall`，Python 用 pylint（仅 E/F 级别），Java 指定 UTF-8
- airline：状态栏显示文件编码，只读标记 `[RO]`
- nerdcommenter 已注释（如需启用，注释符号 `,`）



### programming.vim — 语言加载

> 目前主用 CPP、Python。其它语言配置待补充。

按文件类型自动加载 `lang/<类型>/<类型>.vim`。



**lang/cpp/cpp.vim — C++ 一键编译运行**

| 按键 | 功能 |
| --- | --- |
| `F5` | 保存并编译（g++，`-O2`），自动打开 `in.txt` / `out.txt` 分屏 |
| `F6` | 运行程序 |
| `Ctrl+F6` | 运行并重定向 `in.txt` 到 `out.txt` 后输出 |
| `Ctrl+Enter` | 若在 `in.txt` 中则直接运行，否则先编译再运行 |
| `F4` | 打开/切换到 in/out 分屏 |
| `Ctrl+p` | 将剪贴板内容覆写进 `in.txt` |
| `Ctrl+x` | 快速测试：粘贴输入并运行 |
| `Ctrl+m` / `Ctrl+/` | 可视模式快速行注释 `//` |
| `Ctrl+Space` | 字典补全（基于 `template/dictionary.txt`） |

in/out 分屏：右窗格 `in.txt`（可编辑，宽度 22），右下 `out.txt`（只读）。



**lang/python/python.vim — Python 一键运行**

- `F5` 直接运行；`F6` / `Ctrl+F6` 支持 in/out 文件重定向；`Ctrl+Enter` 等效 `Ctrl+F6`
- 同样的 `Ctrl+p` 覆写输入、`Opentxt` 分屏逻辑



**lang/html/html.vim — HTML**

- `F5` 保存并在默认浏览器中打开



### macm.vim — 模板与缩写
例如在 cpp 文件中输入 `acm` 再按空格/回车，可插入主模板 `t-acm-cpp.cpp`。
`m` 开头的缩写插入对应算法模板（`m-*.cpp`）：

| 模版                      |                        |                                 |                            |                          |
| ------------------------- | ---------------------- | ------------------------------- | -------------------------- | ------------------------ |
| `mqmi` 快速幂             | `mkmp` KMP             | `msegt` 线段树                  | `mmaxflow` 最大流          | `mint128`/`mi128` 大整数 |
| `mqmx` 快速乘             | `mexkmp` 扩展KMP       | `mfenwick` 树状数组             | `mmincost` 费用流          | `mbigint` 高精度         |
| `mgcd` 最大公约数         | `msa` 后缀数组         | `mdsu` 并查集                   | `mzhuliu` 朱刘算法         | `mhash` 哈希             |
| `mexgcd` 扩展欧几里得     | `mmanacher` 回文       | `msplay` Splay                  | `mdlx` Dancing Links       | `mgeo` 计算几何          |
| `mexcrt` 扩展中国剩余定理 | `mtrie` 字典树         | `mmat_tree` 矩阵树              | `mst` 稀疏表               | `mfft` / `mntt` FFT/NTT  |
| `mlcm` 最小公倍数         | `mxor_trie` 异或字典树 | `mlca` 最近公共祖先             | `mrng` 随机                | `mfrac` 分数             |
| `misprime` 素数判断       | `macam` AC自动机       | `m-lowbit` / `mlb` 树状数组技巧 | `mpollard_rho` Pollard-Rho | `mlog` 对数              |
| `mget_phi` 欧拉函数       | `mget_primes` 素数筛   | `mget_inv` 逆元                 | `mget_fact` 阶乘           | `mfact` 阶乘/组合        |
| `mfib` 斐波那契           | `m-exkmp`              | `mgauss` 高斯消元               | `mgauss_xor` 异或线性基    | `mpc` 多项式/组合计数    |
| `mread` 快读              | `mmat` 矩阵            | `msegt`                         |                            |                          |

常用类型缩写（cpp）：`ll` = long long、`ff` = double、`pii` = pair\<int,int\>、`pll`、`vi`、`vll`、`i128` 等；

拼写纠错：`itn`→`int`、`mian`→`main`、`inlcude`→`include`、`cosnt`→`const` 等。

Python 缩写：`ii` = `int(input())`、`mii` = `map(int, input().split(' '))`、`lmii` = `list(map(...))`。



## 依赖

- Windows 版 Vim/GVim 8.x
- [vim-plug](https://github.com/junegunn/vim-plug)（需 git，用于安装插件）
- C++：`g++`（GCC，编译运行用）
- Python：`python` 命令；pylint（可选，ALE 语法检查）
- Java：`javac`（可选）
- airline 状态栏图标建议搭配 Nerd Font



## 备注

- `_vimrc` 中还包含 Windows 下 `diff` 的 `MyDiff()` 兼容处理
- 如需恢复 vim 默认菜单，可修改 `common.vim` 中 `langmenu` / `delmenu.vim` 相关设置
- 模板目录中另有 `dictionary.txt` 供 C++ 字典补全（`Ctrl+Space` 或 `Ctrl+n`）
