# README

The files in this repository are organised in a hierarchical scheme that directly supports
management through [GNU Stow](https://www.gnu.org/software/stow/), a symlink farm manager.

In essence, this repository can be used as a *stow directory*.


## Background

The configuration files for each managed software package are contained within their own, private,
and aptly named directory. This is the *module directory*.

The layout of configuration files and directories within the *module directory* should match that of
where they are supposed to be installed - the *target directory*.

For most common dotfiles the *target directory* would usually be `$HOME` (or `/home/<username>`).


### Example: VIm

VIm will usually look for a `vimrc` located at `$HOME/.vimrc` or `$HOME/vim/vimrc`. The location
relative to `$HOME` should thus be reflected in the *stow directory*, i.e. the config file should be
placed under `<module>/.vimrc` or `<module>/.vim/vimrc` respectively, where `<module>` is a
convenient identifier, e.g. `vim`, but it can be anything that is easy to recognise.

The resultant structure of the *stow directory* should thus be:

```
dotfiles/    <-- root stow directory
└ vim/       <-- "vim" module directory, can be named differently
  └ .vim/    <-- config file hierarchy
    └ vimrc
```

## Installing GNU Stow

GNU Stow is available on most popular Linux distributions directly through their
package manager.

### Debian

```shell
sudo apt install stow
```

### Fedora

```shell
sudo dnf install stow
```

### Gentoo

```shell
sudo emerge -aqv app-admin/stow
```

### macOS (Homebrew)

```shell
brew install stow
```


## Using GNU Stow

The examples below assume that:

* the repository has been cloned under `$HOME/.dotfiles`, and
* the current working directory is `$HOME`

To install or update the symlinks to the dotfiles for a given `<module>` in their correct location
use:

```shell
stow -v -d .dotfiles/ <module> [<module> ...]
```

To remove the configured dotfile symlinks for a given `{module}` use:

```shell
stow -D -d .dotfiles/ <module> [<module> ...]
```

> 📝 **Notes:**
>
> * In GNU Stow nomenclature *modules* are called *packages* but I prefer *modules*
> * Changes can be previewed by providing the `-n` (`--no`) option
> * GNU Stow's will abort all operations if any of the changes to be performed cannot be done - the
    target directory will remain unmodified.
> * GNU Stow will not overwrite *absolute* symlinks

In either case, `-t <install_dir>` or `--target <install_dir>` can be passed if the destination is
not the current working directory, e.g.

```shell
stow -v -d $HOME/.dotfiles/ -t $HOME/ <module> [<module> ...]
```

For more details check out Stow's man page:

```shell
man 8 stow
```
