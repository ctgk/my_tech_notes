# MkDocs

## 日本語検索

日本語検索に対応させるには`mkdocs.yml`に以下を追加

```javascript
extra:
    search:
        language: 'ja'
```

## GitHub連携

MkDocsで作ったサイトを[github](https://github.com)で公開する手順

1. githubで空のレポジトリを作成
    - 仮にmydocsとする
1. `$ git clone mydocs`
1. `$ mkdocs new mydocs`
1. `$ mkdocs gh-deploy`
1. githubのrepositoryから`settings`→`GitHub Pages`→`Source`→`gh-pages branch`
1. アクセスできるようになるまで少し待つ
1. サイトにアクセス

## Extensions

### admonition

`mkdocs.yml`に以下を追加

```javascript
markdown_extensions:
    - admonition
```

### codehilite

```bash
pip install pygments
```

`mkdocs.yml`に以下を追加

```javascript
markdown_extensions:
    - codehilite
```

例

```python
import tensorflow as tf
```

### material

おすすめテーマ

```bash
pip install mkdocs-material
```

`mkdocs.yml`に以下を追加

```javascript
theme:
    name: 'material'
```

### pymdownx

install command

```bash
pip install pymdown-extensions
```

#### details

```javascript
markdown_extensions:
    - pymdownx.details
```

Usage

```markdown
??? note
    detail
```

??? note
    detail

#### keys

`mkdocs.yml`に以下を追加

```javascript
markdown_extensions:
    - pymdownx.keys
```

Usage

`++ctrl+alt+del++`

++ctrl+alt+del++
