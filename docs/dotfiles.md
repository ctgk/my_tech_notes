# Dot Files

## .bashrc

```sh
COLOR_NC='\e[0m' # No Color
COLOR_WHITE='\e[1;37m'
COLOR_BLACK='\e[0;30m'
COLOR_BLUE='\e[0;34m'
COLOR_LIGHT_BLUE='\e[1;34m'
COLOR_GREEN='\e[0;32m'
COLOR_LIGHT_GREEN='\033[01;32m'
COLOR_CYAN='\e[0;36m'
COLOR_LIGHT_CYAN='\e[1;36m'
COLOR_RED='\e[0;31m'
COLOR_LIGHT_RED='\e[1;31m'
COLOR_PURPLE='\e[0;35m'
COLOR_LIGHT_PURPLE='\e[1;35m'
COLOR_BROWN='\e[0;33m'
COLOR_YELLOW='\e[1;33m'
COLOR_GRAY='\e[0;30m'
COLOR_LIGHT_GRAY='\e[0;37m'

# \u ユーザ名
# \h ホスト名
# \W カレントディレクトリ
# \w カレントディレクトリのパス
# \n 改行
# \d 日付
# \[ 表示させない文字列の開始
# \] 表示させない文字列の終了
# \$ $
colored_user="\[${COLOR_BROWN}\]\u\[${COLOR_NC}\]"
colored_host="\[${COLOR_CYAN}\]\h\[${COLOR_NC}\]"
colored_path="\[${COLOR_GREEN}\]\w\[${COLOR_NC}\]"
colored_OK="\[${COLOR_BLUE}\]✓\[${COLOR_NC}\]"
colored_NG="\[${COLOR_RED}\]✘\[${COLOR_NC}\]"
exit_status="\$( [ \$? == 0 ] && echo \"${colored_OK}\" || echo \"${colored_NG}\" )"
PS1_1stline="┌─[${exit_status}]──[${colored_user}@${colored_host}]─[${colored_path}]"
PS1_2ndline="└───╼ \$ "
gitbranch="\$( git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')"
export PS1="\n${PS1_1stline}${gitbranch}\n${PS1_2ndline}"
```

Promptは以下のように表示される

```terminal
┌─[✓]──[username@hostname]─[current-working-dir](master)
└───╼ $

┌─[✘]──[username@hostname]─[current-working-dir](master)
└───╼ $
```

## inputrc

```bash
# .inputrc
set completion-ignore-case on
set bell-style none
```

## vimrc

```bash
# .vimrc
filetype plugin indent on

syntax on

set hlsearch
set ignorecase
set smartcase
set autoindent

set ruler
set number
set list
set wildmenu
set showcmd

set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab

set clipboard=unnamed
set visualbell t_vb=
```
