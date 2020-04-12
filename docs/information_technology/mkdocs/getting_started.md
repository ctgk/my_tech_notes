# Getting Started with MkDocs

<https://www.mkdocs.org/>

## Install

```bash
pip instal mkdocs
```

## Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs help` - Print this help message.

## Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.

## Search

Add the following lines in `mkdocs.yml` to search using Japanese.

```javascript
// mkdocs.yml

extra:
    search:
        language: 'en, ja'
```

## Github Pages

A procedure to deploy documentations to Github Pages

1. Create an empty repository.
1. `$ git clone <the repository>`
1. `$ mkdocs new <the repository>`
1. `$ cd <the repository>`
1. `$ mkdocs gh-deploy`
1. Make sure the source of Github Pages site is `gh-pages` branch configured at `settings`→`Options`→`GitHub Pages`→`Source`→`gh-pages branch`.
1. Wait a while.
1. Access the deployed site.

## Link

Use relative path from the current file path.

### Link to a page

Example:

```markdown
<!-- write relative path -->
[pagelink](getting_started.md)
```

Result:

[pagelink](getting_started.md)

### Link to a section

Example:

```markdown
<!-- write relative path -->
[sectionlink](getting_started.md#Link_to_a_section)
```

Result:

[sectionlink](getting_started.md#link_to_a_section)
