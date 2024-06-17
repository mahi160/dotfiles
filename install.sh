#!/bin/bash
password = $1

# install yay for package management
cd /home/mahi/Documents
pacman -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# install packages
yay -Sy --noconfirm adw-gtk3 brave-bin exa bat kora-icon-theme timeshift timeshift-autosnap github-cli zsh ttf-jetbrains-mono-nerd htop git neovim docker docker-compose stow flameshot onefetch neofetch 

# install cli

curl -fsSL https://fnm.vercel.app/install | bash
curl -sS https://starship.rs/install.sh | sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# setup dotfiles
cd /home/mahi/Documents/dotfiles
git checkout main
rm ~/.zshrc
stow nvim zsh starship -t ~/

# create ssh key
ssh-keygen -t ed25519 -C "mahi@workstation" -f ~/.ssh/id_ed25519
ssh-keygen -t ed25519 -C "sifat@workstation" -f ~/.ssh/qa_ed25519
touch ~/.ssh/config
echo "
# Primary GitHub account
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519

# Secondary GitHub account
Host qp.github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/qp_ed25519
" >> ~/.ssh/config

# install save desktop
flatpak install io.github.vikdevelop.SaveDesktop 

# add smaba
echo "/dev/nvme0n1p3 /mnt/Base auto defaults,nofail 0 0
//192.168.0.103/groot /mnt/Groot cifs username=mahi,password=$password,nofail 0 0
//192.168.0.103/mahi160 /mnt/Mahi160 cifs username=mahi,password=$password,nofail 0 0" >> /etc/fstab

echo "Color" >> /etc/pacman.conf

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"