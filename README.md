# Dotflies

Repo for all the configurations of programs and tools that I use

## Dependencies

- `git`
- `wget`
- `stow` WIP

> [!NOTE]
> The system will be based on `stow` but right now it works on its own

## Installation

Clone the repo into your home folder:

```[bash]
cd ~
git clone git@github.com/cma1100b/.dotfiles
cd .dotfiles
```

Run the installation command

```[bash]
install [config]
```

Were config can be:
- `zsh`: configures `oh-my-zsh`, the font and `powerlevel10k`.
- `nvim`: sets the nvim configuration.
- `all`: executes all the previous ones in order.

If nithing is specified it will run `all`.

Each configuration has its own folder containing its own install script and README
