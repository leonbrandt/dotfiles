Setup linux how I ~~like~~ *need* it in under a minute. This repository is built on Manjaro with i3. It utilizes [pacman](https://archlinux.org/pacman) for package-installation and [GNU Stow](https://www.gnu.org/software/stow) for dotfiles-installation.

## Get going

```bash
sudo ./install.sh
```

This will install several packages and dotfiles.

## Install packages

```bash
sudo ./install_packages.sh
```

This will install every package in every file inside of `package-lists/`. Omit list-files by setting the `SKIP_LISTS`-variable:

```bash
export SKIP_LISTS='audio,media'
sudo ./install_packages.sh
```

## Install dotfiles

```bash
./stow.sh
```

This will (re)install every stow-module in `config/`. You can use several operations (`reinstall` (default), `install`, `uninstall`) like this:

```bash
./stow.sh uninstall
```

Alternatively you can stow modules in `config/` by yourself. Execute `post_stow.sh` as root to trigger some operations, that cannot be achieved via stow:

```bash
sudo ./post_stow.sh
```
