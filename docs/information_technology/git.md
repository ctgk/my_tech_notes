# Git

## config

現在のgitの設定を表示

```bash
git config --global --list
```

現ディレクトリのgitの設定を表示

```bash
git config --list
```

ユーザ名、メールアドレスの設定

```bash
git config --global user.name "ctgk"
git config --global user.email r1135nj54w@gmail.com
```

エディタの設定

```bash
git config --global core.editor 'vim -c "set fenc=utf-8"'
```

gitignoreの設定

```bash
git config --global core.excludesfile ~/.gitignore_global
```

vscodeのworkingspace用設定フォルダをgit管理からのぞく

```gitignore
# .gitignore_global
.vscode/
```

## hook

```bash
$ cd new/git/dir
$ git init
$ cd .git/hooks
$ mv pre-commit.sample pre-commit
$ cd new/git/dir
$ echo -e "\n\n\n" > file  # make a file with multiple empty lines at the bottom
$ git add file; git commit -m "file"
# sample pre-commit script fails
```

## まとめ

`.gitconfig`

```bash
[user]
    name = ctgk
    email = r1135nj54w@gmail.com
[core]
    editor = vim -c \"set fenc=utf-8\"
    excludesfile = /home/ctgk/.gitignore_global
[alias]
    graph = log --graph --decorate -C -M --pretty=format:\"%C(yellow)%h%Creset %ad [%an] %C(auto)%d%Creset %s\" --all --date=short
    graph-with-stash = !git log --graph --decorate -C -M --pretty=format:\"%C(yellow)%h%Creset %ad [%an] %C(auto)%d%Creset %s\" --all --date=short `git reflog show --format=\"%h\" stash`
    top = rev-parse --show-toplevel
```
