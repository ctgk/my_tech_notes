# fish

friendly interactive shell

## Install

```bash
$ sudo add-apt-repository ppa:fish-shell/release-3
$ sudo apt update
$ sudo apt install fish
```

## Change shell

Writing the execution command in `.bashrc` to keep the default shell unchanged.

```bash
# .bashrc

exec fish
```

## fish_greeting

Override `fish_greeting` function to suppress the greeting message from the fish shell.

```fish
# ~/.config/fish/fish_greeting.fish

function fish_greeting
ends
```

## fisher

A package manager for the fish shell.

### Install

```fish
$ curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```

### Usage

#### Refresh

```fish
$ fisher
```

#### Install a plugin

```fish
$ fisher add oh-my-fish/theme-bobthefish
```

#### Uninstall a plugin

```fish
$ fisher rm oh-my-fish/theme/bobthefish
```
