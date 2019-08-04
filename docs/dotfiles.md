# Dot Files

## .bashrc

```sh
CH_BOLD='\[\e[1m\]'

CH_NONE='\[\e[0m\]'
CH_BLACK='\[\e[30m\]'
CH_RED='\[\e[31m\]'
CH_GREEN='\[\e[32m\]'
CH_YELLOW='\[\e[33m\]'
CH_BLUE='\[\e[34m\]'
CH_MAGENTA='\[\e[35m\]'
CH_CYAN='\[\e[36m\]'
CH_GRAY='\[\e[37m\]'
CH_DEFAULT='\[\e[39m\]'

BG_BLACK='\[\e[40m\]'
BG_RED='\[\e[41m\]'
BG_GREEN='\[\e[42m\]'
BG_YELLOW='\[\e[43m\]'
BG_BLUE='\[\e[44m\]'
BG_MAGENTA='\[\e[45m\]'
BG_CYAN='\[\e[46m\]'
BG_GRAY='\[\e[47m\]'
BG_DEFAULT='\[\e[49m\]'
BG_DARK_GRAY='\[\e[48;5;245m\]'

# \u ユーザ名
# \h ホスト名
# \W カレントディレクトリ
# \w カレントディレクトリのパス
# \n 改行
# \d 日付
# \[ 表示させない文字列の開始
# \] 表示させない文字列の終了
# \$ $
colored_user="${CH_YELLOW}\u${CH_DEFAULT}"
colored_host="${CH_CYAN}\h${CH_DEFAULT}"
colored_path="${CH_GREEN}\w${CH_DEFAULT}"
colored_OK="${CH_BLUE}✓${CH_DEFAULT}"
colored_NG="${CH_RED}✘${CH_DEFAULT}"
exit_status="\$( [ \$? == 0 ] && echo \"${colored_OK}\" || echo \"${colored_NG}\" )"
PS1_1stline="┌─[${exit_status}]─[${colored_user}@${colored_host}]─[${colored_path}]"
PS1_2ndline="└─[\t]"
gitbranch="\$( git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/─[\1]/')"
export PS1="\n${PS1_1stline}\n${PS1_2ndline}${gitbranch} \$ "
export PROMPT_DIRTRIM=4
umask 022

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"
    export VIRTUAL_ENV_DISABLE_PROMPT=1
fi

# alias
alias reload="source ~/.bashrc"

# display setting for wsl
export DISPLAY=:0

export PATH="$HOME/local/bin:$PATH"
export PKG_CONFIG_PATH="$HOME/local/lib/pkgconfig:$PKG_CONFIG_PATH"
```

Promptは以下のように表示される

```terminal
┌─[✓]─[user@hostname]─[~/.../current/working/directory/path]
└─[21:51:05]─[branch] $

┌─[✘]─[user@hostname]─[~]
└─[21:53:26] $
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
