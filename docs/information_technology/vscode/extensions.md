# Extensions

List of Visual Studio Code extensions I installed.

## General Features

### Bracket Pair Colorizer

```json
# settings.json
{
    "bracketPairColorizer.consecutivePairColors": [
        "()",
        "[]",
        "{}",
        "<>",
        [
            "Gold",
            "Orchid",
            "LightSkyBlue"
        ],
        "Red"
    ],
}
```

### Code Ace Jumper

```json
# settings.json
{
    "aceJump.dim.enabled": false,
    "aceJump.finder.onlyInitialLetter": false
}
```

```json
# keybindings.json
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
# settings.json
{
    "code-eol.newlineCharacter":"↓",
    "code-eol.returnCharacter" :"⇠",
    "code-eol.crlfCharacter"   :"↵",
}
```

### GlassIt-VSC

Extension to make background of vscode transparent.

```json
# settings.json
{
    "glassit.alpha": 230,
}
```

```json
# keybindings.json
{ "key": "ctrl+alt+z",            "command": "glassit.increase" },
{ "key": "ctrl+alt+c",            "command": "glassit.decrease" },
```

!!! Warning
    Only for Windows 10

### Material Icon Theme

```json
# settings.json
{
    "workbench.iconTheme": "material-icon-theme",
}
```

### Material Theme

```json
# settings.json
{
    "workbench.colorTheme": "Material Theme"
}
```

### zenkaku

`mosapride.zenkaku`

Visualize zenkaku spaces.

++ctrl+shift+p++ → `enable zenkaku`
