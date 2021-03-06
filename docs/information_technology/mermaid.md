# mermaid

## Using mermaid in MkDocs

```javascript
extra_css:
    - https://unpkg.com/mermaid@8.0.0/dist/mermaid.css

extra_javascript:
    - https://unpkg.com/mermaid@8.0.0/dist/mermaid.min.js

markdown_extensions:
    - pymdownx.superfences:
        custom_fences:
            - name: mermaid
              class: mermaid
              format: !!python/name:pymdownx.superfences.fence_div_format
```

!!! note
    <https://cdnjs.cloudflare.com/ajax/libs/mermaid/8.0.0/mermaid.js>などと上記のmermaid.min.jsの違いは不明

## Flow Chart

````markdown
```mermaid
graph TD;
    A --> B;
    A --> B;
    A --> C;
    B --> D;
    C --> D;
```
````

```mermaid
graph TD;
    A --> B;
    A --> B;
    A --> C;
    B --> D;
    C --> D;
```

!!! note
    Firefoxだとノードのサイズがいい感じになる。
    Google Chromeだとテキストに対して大きなノードになってしまう。

### Styling

````markdown
```mermaid
graph LR
    id1(Start)-->id2(Stop)
    style id1 fill:#f9f,stroke:#333,stroke-width:4px;
    style id2 fill:#ccf,stroke:#f66,stroke-width:2px,stroke-dasharray: 5, 5;
```
````

```mermaid
graph LR
    id1(Start)-->id2(Stop)
    style id1 fill:#f9f,stroke:#333,stroke-width:4px;
    style id2 fill:#ccf,stroke:#f66,stroke-width:2px,stroke-dasharray: 5, 5;
```

## Sequence Diagram

````markdown
```mermaid
sequenceDiagram
loop every day
    Alice->>John: Hello John, how are you?
    John-->>Alice: Great!
end
```
````

```mermaid
sequenceDiagram
loop every day
    Alice->>John: Hello John, how are you?
    John-->>Alice: Great!
end
```
