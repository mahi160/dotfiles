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
  - Run `stow zsh starship nvim -t ~/`
  - If it fails, make sure to run `rm ~/.zshrc`. This will remove the old zsh config.
  - Restart terminal: `source ~/.zshrc`

## Server

### Add portainer

- Create docker

```bash
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.21.0
```

- Got to `https://localhost:9443`
- Login with with new credentials
- Go to stacks
- Add stacks
  - Give a name
  - Copy the content of `server/docker-compose.yml` and paste it in the editor. Comment any services if you don't need them.
  - Upload .env file by modifying the paths
- Deploy Stack

### My Stack

- _Jellyfin_: Media player like netflix. Url: `https://{host}:8096`
- _Transmission_: Torrent client. Url: `https://{host}:9091`
- _Jellyseer_: Request movie / series. Url: `https://{host}:5055`
- _Bazarr_: Auto download subtitles. Url: `https://{host}:6767`
- _Calibre-Web_: Read books online from calire. Url: `https://{host}:8083`
- _Calibre_: Books manager. Url: `https://{host}:8082`
- _Prowlarr_: Torrent urls setup. Url: `https://{host}:9696`
- _Radarr_: Auto movie manager. Url: `https://{host}:7878`
- _Sonarr_: Auto series. Url: `https://{host}:8989`
- _Duplicati_: Backups. Url: `https://{host}:8200`
- _Watchtower_: Docker auto updater. Url: `https://{host}:8080`
- _FlareSolverr_: DNS for torrents. Url: `https://{host}:8191`
- _AdGuard_: Network wide DNS Ad blocker. Url: `https://{host}:8088`
