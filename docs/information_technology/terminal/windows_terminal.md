# Windows Terminal

## Install

Install from Microsoft Store.

## Configuration

```json
// profile.json


// To view the default settings, hold "alt" while clicking on the "Settings" button.
// For documentation on these settings, see: https://aka.ms/terminal-documentation

{
    "$schema": "https://aka.ms/terminal-profiles-schema",

    "defaultProfile": "{660f651f-9c17-41bc-956d-1826abda9085}",
    "globals" :
    {
        "requestedTheme" : "dark",
        "wordDelimiters" : " ./\\()\"'-:,.;<>~!@#$%^&*|+=[]{}~?\u2502"
    },

    "profiles":
    {
        "defaults":
        {
            "closeOnExit": "always",
            "fontFace": "Source Code Pro for Powerline",
            "fontSize": 10,
            "hidden": false
        },
        "list":
        [
            {
                "commandline": "wsl.exe ~ -d Ubuntu-18.04 -- source .bashrc; exec fish",
                "guid": "{660f651f-9c17-41bc-956d-1826abda9085}",
                "name": "Ubuntu-18.04 fish"
            },
            {
                "guid": "{8c58b3c5-c545-4314-a6b6-a9f7922633e5}",
                "commandline": "C:\\Program Files\\Git\\bin\\bash.exe",
                "name": "Git Bash",
                "icon": "C:/Program Files/Git/mingw64/share/git/git-for-windows.ico",
                "startingDirectory": "%USERPROFILE"
            },
            {
                "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
                "name": "Windows PowerShell",
                "commandline": "powershell.exe"
            },
            {
                "guid": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
                "name": "cmd",
                "commandline": "cmd.exe"
            },
            {
                "guid": "{c6eaf9f4-32a7-5fdc-b5cf-066e8a4b1e40}",
                "hidden": false,
                "name": "Ubuntu-18.04",
                "source": "Windows.Terminal.Wsl"
            },
            {
                "guid": "{6f9994f0-4403-5e85-9cce-98e5da3839bb}",
                "hidden": false,
                "name": "Ubuntu-16.04",
                "source": "Windows.Terminal.Wsl"
            },
            {
                "guid": "{7f586916-8357-53d4-bb2b-ca96f639898a}",
                "hidden": false,
                "name": "WLinux",
                "source": "Windows.Terminal.Wsl"
            },
            {
                "guid": "{b453ae62-4e3d-5e58-b989-0a998ec441b8}",
                "hidden": false,
                "name": "Azure Cloud Shell",
                "source": "Windows.Terminal.Azure"
            }
        ]
    },

    // Add custom color schemes to this array
    "schemes": [],

    // Add any keybinding overrides to this array.
    // To unbind a default keybinding, set the command to "unbound"
    "keybindings": [
        {
            "keys": ["ctrl+,"],
            "command": "openSettings"
        },
        // panes
        {
            "keys": ["ctrl+s"],
            "command": {
                "action": "splitPane",
                "split": "vertical",
                "splitMode": "duplicate"
            }
        },
        {
            "keys": ["ctrl+shift+s"],
            "command": {
                "action": "splitPane",
                "split": "horizontal",
                "splitMode": "duplicate"
            }
        },
        {
            "keys": ["ctrl+up"],
            "command": "moveFocusUp"
        },
        {
            "keys": ["ctrl+down"],
            "command": "moveFocusDown"
        },
        {
            "keys": ["ctrl+left"],
            "command": "moveFocusLeft"
        },
        {
            "keys": ["ctrl+right"],
            "command": "moveFocusRight"
        },
        // tabs
        {
            "keys": ["ctrl+tab"],
            "command": "nextTab"
        },
        {
            "keys": ["ctrl+shift+tab"],
            "command": "prevTab"
        },
        {
            "keys": ["ctrl+t"],
            "command": "openNewTabDropdown"
        },
        // font
        {
            "keys": ["ctrl+minus"],
            "command": "decreaseFontSize"
        },
        {
            "keys": ["ctrl+shift+plus"],
            "command": "increaseFontSize"
        }
    ]
}
```
