# C/C++

## プロジェクト

ディレクトリ構成などの参考に

<https://medium.com/heuristics/c-application-development-part-1-project-structure-454b00f9eddc>

## ドキュメント

Doxygen

<https://kezunlin.me/post/917a155d/>
<https://qiita.com/t-kashima/items/a0ae4929ca8b5728d5bc>

インストール

```bash
sudo apt install doxygen graphviz
```

## テスト

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

<!-- ## VSCode + Visual Studio

1. Visual Studioをインストール
1. [VSCode](vscode.md)をインストールし、[C/C++拡張](../vscode#cc)を追加
1. 作業用のディレクトリを作成

    ```bash
    mkdir visual_studio_workspace
    ```

1. 作業用ディレクトリをVSCodeで開く

    ```bash
    code visual_studio_workspace
    ```

1. ++ctrl+shift+p++
1. `C/C++: Edit Configurations (JSON)`
1. インクルードディレクトリを追加

    ```json
    {
        "configurations": [
            {
                "includePath": [
                    "${workspaceFolder}/**",
                    "C:/Program Files (x86)/Microsoft Visual Studio/2017/Community/VC/Tools/MSVC/14.14.26428/ATLMFC/include",
                    "C:/Program Files (x86)/Microsoft Visual Studio/2017/Community/VC/Tools/MSVC/14.14.26428/include",
                    "C:/Program Files (x86)/Windows Kits/NETFXSDK/4.6.1/include/um",
                    "C:/Program Files (x86)/Windows Kits/10/include/10.0.17134.0/ucrt",
                    "C:/Program Files (x86)/Windows Kits/10/include/10.0.17134.0/shared",
                    "C:/Program Files (x86)/Windows Kits/10/include/10.0.17134.0/um",
                    "C:/Program Files (x86)/Windows Kits/10/include/10.0.17134.0/winrt",
                    "C:/Program Files (x86)/Windows Kits/10/include/10.0.17134.0/cppwinrt",
                ],
            }
        ]
    }
    ```

1. 作業中のディレクトリ下に`CMakeLists.txt`を作成

    ```txt
    cmake_minimum_required(VERSION 3.13.2)
    project(visual_studio_project)
    add_executable(main main.cpp)
    ```

1. `main.cpp`を作成

    ```c++
    #include <iostream>

    int main()
    {
        std::cout << "hello world" << std::endl;
        return 0;
    }
    ```

### 参考

[VSCodeでC/C++(MSBuild編)](https://www.off-soft.net/ja/software/develop2/vscode-cpp-develop-msbuild.html) -->

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
