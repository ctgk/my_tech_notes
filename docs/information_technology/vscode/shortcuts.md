# Keyboard Shortcuts

My basic keybinds for Visual Studio Code.

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
