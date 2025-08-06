# dotfiles

My dotfiles, managed with [chezmoi](https://github.com/twpayne/chezmoi). Compatible with Ubuntu on WSL.


## WSL 

### Requirements

- zsh
- [Jetbrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads) (for the windows terminal)

### Quickstart

One line initialization command.

`sh -c "$(curl -fsLS chezmoi.io/getlb)" -- init --apply windy-worm` 
 
This installs chezmoi, clones the repo, and applies dotfiles. Follow the on-screen prompts to setup git email and username.

### Scripts description

#### [`run_once_01-setup_zsh_bash.sh`](run_once_01-setup_zsh_bash.sh.tmpl)

Installs [`oh-my-zsh`](https://github.com/ohmyzsh/ohmyzsh), [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions), [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting), and [`oh-my-bash`](https://github.com/ohmybash/oh-my-bash) if they are not already installed.

## Individual Steps

1. Install `chezmoi` by following [chezmoi's install guide](https://github.com/twpayne/chezmoi/blob/master/docs/INSTALL.md). You can learn more about `chezmoi` by reading their [quick start guide](https://github.com/twpayne/chezmoi/blob/master/docs/QUICKSTART.md) or [how-to guide](https://github.com/twpayne/chezmoi/blob/master/docs/HOWTO.md).

2. Initialize `chezmoi` using this repository: `chezmoi init https://github.com/windy-worm/dotfiles.git`.

3. Preview changes that `chezmoi` would make to your `$HOME`: `chezmoi diff`.

4. Apply the changes: `chezmoi apply`. This will automatically install `zsh` and set it to the default shell using [run_once_install-packages.sh](run_once_install-packages.sh) script.

### Fonts

The primary font I use is the [JetBrains Mono Nerd Font](https://www.nerdfonts.com) which has been patched to support [Nerd Font](https://www.nerdfonts.com) ligatures and special characters.

Shout out to some repositories that I "borrowed" configuration and styles from:

- [ScooterDelta dotfiles ](https://github.com/ScooterDelta/dotfiles)
## License

MIT