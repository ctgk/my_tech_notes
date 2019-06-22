# Visual Studio Code

## Settings

VS Codeの個人的設定

文字コードはutf8

```json
// settings.json
{
    // "editor.fontSize": 12, // 画面に合わせて調整
    "editor.hideCursorInOverviewRuler": true, // ?
    "editor.minimap.enabled": false,
    "editor.renderIndentGuides": true, // ブロックの始まりから終わりまで線を引く
    "editor.renderWhitespace": "boundary", // 単語間の単一スペース以外の空白を可視化
    "editor.rulers": [80],
    "editor.wordWrap": "on",

    "extensions.autoUpdate": false,

    "files.autoSave": "off",
    "files.eol": "\n",
    "files.insertFinalNewline": true,
    "files.trimTrailingWhitespace": true,

    "terminal.integrated.shell.windows": "C:\\WINDOWS\\System32\\wsl.exe", // Windowsでwslをつかうなら

    "window.zoomLevel": 0,
}
```

## Keyboard Shortcuts

```json
// keybindings.json
[
    {
        "key": "ctrl+p",
        "command": "workbench.action.quickOpen"
    },
    {
        "key": "ctrl+e",
        "command": "-workbench.action.quickOpen"
    },
    {
        "key": "alt+d",
        "command": "editor.action.addSelectionToNextFindMatch",
        "when": "editorFocus"
    },
    {
        "key": "enter",
        "command": "-acceptSelectedSuggestionOnEnter",
        "when": "acceptSuggestionOnEnter && suggestWidgetVisible && suggestionMakesTextEdit && textInputFocus"
    },
]
```

## 汎用拡張機能

### Bracket Pair Colorizer

There is a new version of this extension

<https://github.com/CoenraadS/Bracket-Pair-Colorizer-2>

### Code Ace Jumper

settings.json

```json
{
    "aceJump.dim.enabled": false,
    "aceJump.finder.onlyInitialLetter": false
}
```

keybindings.json

```json
[
    {
        "key": "shift+enter",
        "command": "extension.aceJump"
    }
]
```

### code-eol 2019

jeff-hykin.code-eol

```json
{
    "code-eol.newlineCharacter":"↓",
    "code-eol.returnCharacter" :"⇠",
    "code-eol.crlfCharacter"   :"↵",
}
```

### Doxygen Documentation Generator

とりあえず入れるだけで動作してくれている

### GitLens

eamodio.gitlens

local環境でgithubとかみたいにgitの情報を見やすくしてくれる

### GlassIt-VSC

背景透明化

!!! Note
    Windows10のみ対応

### Material Icon Theme

```json
{
    "workbench.iconTheme": "material-icon-theme",
}
```

### Material Theme

```json
{
    "workbench.colorTheme": "Material Theme"
}
```

### SSH FS

リモートファイルをVSCodeで編集できる

```json
{
    "sshfs.configs": [
        {
            "host": "<ip address>",
            "name": "raspberrypi",
            "password": true,
            "port": 22,
            "root": "/home/pi/",
            "username": "pi"
        }
    ]
}
```

!!! Note
    2019/4/30にMicrosoft自ら「Remote Development」という拡張機能を発表している。

### zenkaku

mosapride.zenkaku

全角スペースの可視化

++ctrl+shift+p++ → `enable zenkaku`

## 各言語用拡張機能

### AutoHotkey

slevesque.vscode-autohotkey

autohotkeyのスクリプトを編集するときにsyntaxを見やすくするためだけに入れている

### C/C++

c_cpp_properties.jsonをプロジェクト毎に作るのが面倒

### CMake

twxs.cmake

WSL上のcmakeを設定する方法ってあるのかな？

### markdownlint

davidanson.vscode-markdownlint

とりあえず入れるだけでめっちゃ注意してくれる

### Markdown Preview Enhanced

shd101wyy.markdown-preview-enhanced

インストールするだけでdefaultとは別にこの拡張機能でmarkdownのpreviewが見れるようになる

### Python

WSL上のPythonをWindows上のVSCodeからデバッグできるようにならないのかな？

### autoDocstring

Python用のdocstring生成

doxygen documentation generatorで代替可能？

```json
{
    "autoDocstring.docstringFormat": "numpy"
}
```

### Language-Cython

guyskk.language-cython

Cythonを少し見やすくしてくれる。

### Rainbow CSV

mechatroner.rainbow-csv

csv, tsvファイルを見やすくしてくれる
SQL的な機能もあるらしい

