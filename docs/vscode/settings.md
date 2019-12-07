# Settings

My basic settings for Visual Studio Code.

```json
// settings.json
{
    "editor.acceptSuggestionOnCommitCharacter": false,
    "editor.acceptSuggestionOnEnter": "off",
    "editor.minimap.enabled": false,
    "editor.renderIndentGuides": true, // draw a line from the beginning of an indent to the end.
    "editor.renderWhitespace": "boundary",
    "editor.rulers": [80],
    "editor.wordSeparators": "`~!@#$%^&*()-=+[{]}\\|;:'\",.<>/?_",
    "editor.wordWrap": "on",

    "extensions.autoUpdate": false,

    "files.autoSave": "off",
    "files.encoding": "utf8",
    "files.eol": "\n",
    "files.insertFinalNewline": true,
    "files.trimTrailingWhitespace": true,

    "terminal.integrated.cursorStyle": "line",
    "terminal.integrated.shell.windows": "C:\\WINDOWS\\System32\\wsl.exe", // if you want to use wsl

    "workbench.editor.enablePreview": false,
}
```
