# Command Line Interface

## Prompt

For Linux

```txt
PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[1;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[1;31m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\[\033[0;37m\]]\342\224\200[\[\033[1;32m\]\w\[\033[0;37m\]]\$(__git_ps1 '(%s)')\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\$ "
```

```terminal
┌─[username@hostname]─[current-working-dir](git-branch)
└──╼ $

┌─[✗]─[username@hostname]─[current-working-dir](git-branch)
└──╼ $
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
