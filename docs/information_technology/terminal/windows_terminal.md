# Windows Terminal

## Install

Install from Microsoft Store.

## Configuration

```json
// profile.json

{
    "globals" :
    {
        "keybindings" :
        [
            // panes
            {   "command": "splitVertical",         "keys": ["alt+s"]           },
            {   "command": "splitHorizontal",       "keys": ["alt+shift+s"]     },
            // tabs
            {   "command": "nextTab",               "keys": ["ctrl+tab"]        },
            {   "command": "prevTab",               "keys": ["ctrl+shift+tab"]  },
            {   "command": "openNewTabDropdown",    "keys": ["ctrl+t"]          },
            // font
            {   "command": "decreaseFontSize",      "keys": ["ctrl+minus"]      },
            {   "command": "increaseFontSize",      "keys": ["ctrl+shift+plus"] },

            {   "command": "paste",                 "keys": ["ctrl+v"]          },

            {   "command": "scrollDown",            "keys": ["alt+shift+n"]     },
            {   "command": "scrollUp",              "keys": ["alt+shift+p"]     }
        ],
        "requestedTheme" : "dark",
        "wordDelimiters" : " ./\\()\"'-:,.;<>~!@#$%^&*|+=[]{}~?\u2502"
    },
    "profiles" :
    [
        {
            "name": "Git Bash",
            "closeOnExit" : true,
            "commandline": "C:\\Program Files\\Git\\bin\\bash.exe",
            "icon": "C:/Program Files/Git/mingw64/share/git/git-for-windows.ico",
            "padding" : "0, 0, 0, 0",
            "startingDirectory": "%USERPROFILE%"
        }
    ]
}
```
