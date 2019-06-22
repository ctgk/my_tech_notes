# browser

## Google Chrome

### Vimium

## Firefox

### Vim-Vixen

下の設定でGoogle Chromeの拡張機能Vimiumのデフォルトのキーマッピングに似せている

```json
{
  "keymaps": {
    ":": {
      "type": "command.show"
    },
    "t": {
      "type": "command.show.tabopen",
      "alter": false
    },
    "k": {
      "type": "scroll.vertically",
      "count": -1
    },
    "j": {
      "type": "scroll.vertically",
      "count": 1
    },
    "h": {
      "type": "scroll.horizonally",
      "count": -1
    },
    "l": {
      "type": "scroll.horizonally",
      "count": 1
    },
    "<C-U>": {
      "type": "scroll.pages",
      "count": -0.5
    },
    "u": {
      "type": "scroll.pages",
      "count": -0.5
    },
    "<C-D>": {
      "type": "scroll.pages",
      "count": 0.5
    },
    "d": {
      "type": "scroll.pages",
      "count": 0.5
    },
    "gg": {
      "type": "scroll.top"
    },
    "G": {
      "type": "scroll.bottom"
    },
    "<C-Z>": {
      "type": "tabs.reopen"
    },
    "J": {
      "type": "tabs.prev"
    },
    "K": {
      "type": "tabs.next"
    },
    "r": {
      "type": "tabs.reload",
      "cache": false
    },
    "R": {
      "type": "tabs.reload",
      "cache": true
    },
    "f": {
      "type": "follow.start",
      "newTab": false,
      "background": false
    },
    "F": {
      "type": "follow.start",
      "newTab": true,
      "background": false
    },
    "H": {
      "type": "navigate.history.prev"
    },
    "L": {
      "type": "navigate.history.next"
    },
  },
  "search": {
    "default": "google",
    "engines": {
      "google": "https://google.com/search?q={}",
      "yahoo": "https://search.yahoo.com/search?p={}",
      "bing": "https://www.bing.com/search?q={}",
      "duckduckgo": "https://duckduckgo.com/?q={}",
      "twitter": "https://twitter.com/search?q={}",
      "wikipedia": "https://en.wikipedia.org/w/index.php?search={}"
    }
  },
  "properties": {
    "hintchars": "abcdefghijklmnopqrstuvwxyz",
    "smoothscroll": true,
    "complete": "sbh"
  },
  "blacklist": []
}
```
