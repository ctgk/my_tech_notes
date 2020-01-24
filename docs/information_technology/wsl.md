# Windows Subsystem for Linux

## ホームディレクトリ変更

デフォルトのホームディレクトリはWindows側からはアクセスできないので、
Windows側からwslのホームディレクトリに簡単にアクセスできるようにしたい場合の手順

1. 事前にホームディレクトリ下にあるものを新しくホームディレクトリとしたいところにコピーしておく

    ```bash
    cp -r /home/username /mnt/c/path/to/new/home/username
    ```

1. `/etc/passwd`をsudo権限で開く

    ```bash
    sudo vim /etc/passwd
    ```

1. 下のほうにこんな行があるはず

    ```txt
    ユーザー名:x:1000:1000:,,,:/home/ユーザー名:/bin/bash
    ```

1. この行を編集してホームディレクトリを変更

    ```txt
    ユーザー名:x:1000:1000:,,,:/mnt/c/wsl_home/ユーザー名:/bin/bash
    ```

1. ログアウトしてから、再度ログインしてホームディレクトリが変更しているかを確認

    ```bash
    $ pwd
    /mnt/c/wsl_home/ユーザー名
    ```
