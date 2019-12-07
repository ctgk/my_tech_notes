# Visual Studio Code

## Settings

VS Codeの個人的設定

文字コードはutf8

```json
// settings.json
{
    "editor.acceptSuggestionOnCommitCharacter": false,
    "editor.acceptSuggestionOnEnter": "off",
    // "editor.fontSize": 13,
    "editor.minimap.enabled": false,
    "editor.renderIndentGuides": true, // ブロックの始まりから終わりまで線を引く
    "editor.renderWhitespace": "boundary",
    "editor.rulers": [80],
    "editor.wordSeparators": "`~!@#$%^&*()-=+[{]}\\|;:'\",.<>/?_",
    "editor.wordWrap": "on",

    "extensions.autoUpdate": false,

    "files.autoSave": "off",
    "files.eol": "\n",
    "files.insertFinalNewline": true,
    "files.trimTrailingWhitespace": true,

    "terminal.integrated.shell.windows": "C:\\WINDOWS\\System32\\wsl.exe", // Windowsでwslをつかうなら
    "terminal.integrated.cursorStyle": "line",

    "workbench.editor.enablePreview": false,
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

### Remote Development

これを入れればWindows上のVSCodeでWSLなどのPythonなどでの開発ができるようになる

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

`Remote Development`なしでWSL上でのC/C++環境をセットアップする場合は[こっち](c_cpp.md#vscode_wsl)を参照

#### snippet

インクルードガード用のスニペット

```json
{
	// Place your snippets for cpp here. Each snippet is defined under a snippet name and has a prefix, body and
	// description. The prefix is what is used to trigger the snippet and the body will be expanded and inserted. Possible variables are:
	// $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. Placeholders with the
	// same ids are connected.
	// Example:
	// "Print to console": {
	// 	"prefix": "log",
	// 	"body": [
	// 		"console.log('$1');",
	// 		"$2"
	// 	],
	// 	"description": "Log output to console"
	// }

	"Insert include guard": {
		"prefix": ["#ifndef"],
		"body": [
			"#ifndef ${2/(.*)/${1:/upcase}/}",
			"#define ${2/(.*)/${1:/upcase}/}",
			"",
			"#endif // ${2/(.*)/${1:/upcase}/}"
		],
		"description": "insert classic style include gurad"
	}
}
```

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

