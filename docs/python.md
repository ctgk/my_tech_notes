# Python

## インストール

### intelpython

<https://software.intel.com/en-us/articles/using-intel-distribution-for-python-with-anaconda>

### Linux

1. pyenvをダウンロード

    ```bash
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    ```

1. githubのページからリリースを確認して、checkout

    ```bash
    git checkout v1.2.12
    ```

1. .bashrcを編集

    ```bash
    $ vim ~/.bashrc
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    ```

1. .bashrcを更新

    ```bash
    source ~/.bashrc
    ```

1. pyenv-virtualenvをインストール

    ```bash
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    ```


1. 好みでpyenv-aliasをインストール

    ```bash
    git clone https://github.com/s1341/pyenv-alias.git $(pyenv root)/plugins/pyenv-alias
    ```

    pyenv-aliasのgithubに乗っている例：

    ```bash
    VERSION_ALIAS="2.7.6_shared" PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 2.7.6
    ```

#### python

1. pyenvで通常のpythonをインストール

    ```bash
    pyenv install 3.7.0
    ```

    エラーが出たら必要なものをインストール

    ```bash
    # run next line in case of error
    $ sudo apt install zlib1g-dev libssl-dev libffi-dev

    # run next line to remove warning
    $ sudo apt install libbz2-dev libreadline-dev libsqlite3-dev
    ```

#### miniconda

1. インストールできる環境を確認する

    ```bash
    $ pyenv install -l | grep miniconda
    ...
    miniconda3-3.9.1
    miniconda3-3.10.1
    miniconda3-3.16.0
    miniconda3-3.18.3
    miniconda3-3.19.0
    miniconda3-4.0.5
    miniconda3-4.1.11
    miniconda3-4.2.12
    miniconda3-4.3.11
    miniconda3-4.3.14
    miniconda3-4.3.21
    miniconda3-4.3.27
    miniconda3-4.3.30
    ```

1. インストールしたい環境をインストール

    !!! note
        miniconda3-latestをインストールするとインストール後に確認するときもminiconda3-latestと表示される。
        versionを確認できるようにしたかったので、これはインストールしない。

1. インストールできたか確認

    ```bash
    $ pyenv versions
    * system (set by ~/.pyenv/version)
    miniconda3-4.3.30
    ```

1. systemのpythonからminicondaのpythonに切り替える

    ```bash
    pyenv global miniconda3-4.3.30
    ```

1. 切り替わったか確認

    ```bash
    $ python --version
    最近のpythonが入っているはず
    ```
