# MkDocs

## Install

```bash
pip instal mkdocs
pip install mkdocs-material
pip install markdown-blockdiag
```

下にあるpygmentsなどはmkdocs-materialをインストールすれば勝手に入る

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

### markdown-blockdiag

```bash
pip install markdown-blockdiag
```

!!! warning
    Windows10では動かないかも。WSLなら動いた。

```javascript
markdown_extensions:
    - markdown_blockdiag:
        format: svg
```

Example:

```markdown
blockdiag {
    // simple graph
    A -> B;
    A -> B -> C -> D;
    A -> E -> F -> G;
}
```

Result:

blockdiag {
    // simple graph
    B -> A;
    A -> B -> C -> D;
    A -> E -> F -> G;
    X -> Z;
    Y -> Z;
    Z -> W;
    Z -> V;
}

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

#### arithmatex

inline equation `$r = x\cos\theta$` $r = x\cos\theta$

displayed formulas

```markdown
$$
p(y|x) \propto p(x|y)p(y)
$$
```

$$
p(y|x) \propto p(x|y)p(y)
$$

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

キー一覧などの詳細：
<https://facelessuser.github.io/pymdown-extensions/extensions/keys/>

#### [mermaid](mermaid.md)

```markdown

```mermaid
graph TD;
    A --> B;
    A --> B;
    A --> C;
    B --> D;
    C --> D;

```

```mermaid
graph TD;
    A --> B;
    A --> B;
    A --> C;
    B --> D;
    C --> D;
```