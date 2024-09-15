# How I setup my dotfiles

## Common Setup

### Setup package manager & terminal

- Add `Color` to `/etc/pacman.conf`. **ctrl+s** to save and **ctrl+x** to exit.

```sh
sudo nano /etc/pacman.conf
```

- Install _yay_

```sh
sudo pacman -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

- Install _zsh_, _neovim_, _stow_

```sh
yay -S zsh neovim stow
```

- Add oh-my-zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- Add zsh plugins

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```

- Add _fnm_, _starship_

```sh
curl -sS https://starship.rs/install.sh | sh
curl -fsSL https://fnm.vercel.app/install | bash
```

- Make dotfiles active
  - Clone this repo `git clone https://github.com/mahi160/dotfiles.git`
  - Go to _dotfiles_ folder: `cd dotfiles`
  - Clear all current dotfiles: `rm ~/.zshrc ~/.config/alacritty ~/.config/nvim ~/.config/starship.toml ~/.config/tmux`
  - Run `stow zsh starship nvim alacritty tmux -t ~/`
  - Restart terminal: `source ~/.zshrc`

## Server

Read [ReadMe](https://github.com/mahi160/dotfiles/blob/main/server/ReadMe.md)
