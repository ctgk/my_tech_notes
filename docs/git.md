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
