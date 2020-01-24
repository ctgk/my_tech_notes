# C/C++

## Project structure

reference: <https://medium.com/heuristics/c-application-development-part-1-project-structure-454b00f9eddc>

## Doxygen

Documentation tool

```bash
sudo apt install doxygen graphviz
```

<https://kezunlin.me/post/917a155d/>
<https://qiita.com/t-kashima/items/a0ae4929ca8b5728d5bc>

## clang-format

Formatting tool

```bash
sudo apt install clang-format
```

Visual Studio Code uses config defined in `.clang-format` if you add the following line in `settings.json`.

```json
    "C_Cpp.clang_format_style": "file"
```

<http://shinriyo.hateblo.jp/entry/2015/05/11/.clang-format%E3%81%AE%E4%BD%9C%E3%82%8A%E6%96%B9>

<https://zed0.co.uk/clang-format-configurator/>

## clang-tidy

Linter

```bash
sudo apt install clang-tidy
```

```bash
# dump configuration to standard output
clang-tidy -dump-config
```

## テスト

### ライブラリ

- `CppUTest` <https://cpputest.github.io/mocking_manual.html>
- `Google Test`

### static関数の単体テスト

static関数が定義されているcソースファイルをそのままテストソースにインクルードすると、
複数のテストソースファイルをコンパイルするときに面倒になる。
なので、static関数が定義されているcソースファイルをincludeするファイルを一つだけ作って、
staticがついていない関数でラップする。
コンパイルするのはラップした関数があるほうだけにすれば、multiple definitionなどで怒られることがなくなる。

<https://blog.wingman-sw.com/archives/450>

```c
// header
// include guard
# include "header_of_original_code.h"

int nonstatic_function_which_was_originally_static(int a);
```

```c
// source
#include "source_of_original_code.c"

int nonstatic_function_which_was_originally_static(int a) {
    return static_function_you_want_to_test(a);
}
```

## Jupyter Notebook

```bash
conda install xeus-cling -c conda-forge
```

xeus-cling用にまっさらなminiconda環境を用意したほうがいいらしい

<https://github.com/QuantStack/xeus-cling>

## メモリリークチェック

```bash
valgrind --leak-check=full ./a.out
```

## デバッグ実行

コンパイルオプション

```bash
g++ main.cpp -g3 -O0
```

## VSCode + WSL

このメモを書いたときのVersion

- VSCode: 1.35.1
- C/C++(ms-vscode.cpptools): 0.23.1

以下、設定手順

1. ++ctrl+shift+p++
1. `C/C++: Edit Configurations (JSON)`

    ```json hl_lines="4 13 16"
    {
        "configurations": [
            {
                "name": "WSL",
                "includePath": [
                    "${workspaceFolder}/**"
                ],
                "defines": [
                    "_DEBUG",
                    "UNICODE",
                    "_UNICODE"
                ],
                "compilerPath": "/usr/bin/g++",
                "cStandard": "c11",
                "cppStandard": "c++17",
                "intelliSenseMode": "gcc-x64"
            }
        ],
        "version": 4
    }
    ```

1. taskの設定
    - 設定したい場合は[ここ](https://qiita.com/masaoy/items/e140d113b1c455980aaf)とかを参考に
1. デバッガーの設定
    1. ++ctrl+shift+p++
    1. `Debug: Open Launch.json`
    1. `C++ (GDB/LLDB)`
    1. `Default Configuration`
    1. 右下の`Add Configuration...`をクリック
    1. `C/C++: (gdb) Bash on Windows Launch`を選択
    1. `launch.json`を編集([参考サイト](http://my-web-site.iobb.net/~yuki/2018-03/soft-tool/wsl-vscode/))

        remote developtmentを使う場合

        ```json
        {
            "version": "0.2.0",
            "configurations": [
                {
                    "name": "(gdb) Launch",
                    "type": "cppdbg",
                    "request": "launch",
                    "program": "${workspaceFolder}/a.out",
                    "args": [],
                    "stopAtEntry": false,
                    "cwd": "${workspaceFolder}",
                    "environment": [],
                    "externalConsole": false,
                    "MIMode": "gdb",
                    "setupCommands": [
                        {
                            "description": "Enable pretty-printing for gdb",
                            "text": "-enable-pretty-printing",
                            "ignoreFailures": true
                        }
                    ]
                }
            ]
        }
        ```

        remote developtmentなしの場合

        ```json hl_lines="8 11 27 28 29"
        {
            "version": "0.2.0",
            "configurations": [
                {
                    "name": "(gdb) Bash on Windows Launch",
                    "type": "cppdbg",
                    "request": "launch",
                    "program": "/mnt/c/Users/username/abs/path/to/wsl_workspace/a.out",
                    "args": [],
                    "stopAtEntry": false,
                    "cwd": "/mnt/c/Users/username/abs/path/to/wsl_workspace/",
                    "environment": [],
                    "externalConsole": true,
                    "pipeTransport": {
                        "debuggerPath": "/usr/bin/gdb",
                        "pipeProgram": "${env:windir}\\system32\\bash.exe",
                        "pipeArgs": ["-c"],
                        "pipeCwd": "/"
                    },
                    "setupCommands": [
                        {
                            "description": "Enable pretty-printing for gdb",
                            "text": "-enable-pretty-printing",
                            "ignoreFailures": true
                        }
                    ],
                    "sourceFileMap": {
                        "/mnt/c/": "C:\\"
                    }
                }
            ]
        }
        ```

        !!! warning
            WSL上での絶対pathを書く必要がある
