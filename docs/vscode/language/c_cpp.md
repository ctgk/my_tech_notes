# C/C++

## Extension

`ms-vscode.cpptools`

## Snippet

Include guard insertion.

```json
{
	"Insert include guard": {
		"prefix": ["#ifndef"],
		"body": [
			"#ifndef ${2/(.*)/${1:/upcase}/}",
			"#define ${2/(.*)/${1:/upcase}/}",
			"",
			"#endif // ${2/(.*)/${1:/upcase}/}"
		],
		"description": "insert classic style include gurad"
	}
}
```
