# MkDocs

## GitHub連携

MkDocsで作ったサイトを[github](https://github.com)で公開する手順

1. githubで空のレポジトリを作成
    - 仮にmydocsとする
1. `git clone mydocs`
1. `mkdocs new mydocs`
1. `mkdocs gh-deploy`
1. githubのrepositoryから`settings`→`GitHub Pages`→`Source`→`gh-pages branch`
1. アクセスできるようになるまで少し待つ
1. サイトにアクセス

## Extensions

### material

おすすめテーマ

```bash
pip install mkdocs-material
```

`mkdocs.yml`に以下を追加

```yml
theme:
    name: 'material'
```
