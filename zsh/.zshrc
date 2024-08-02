export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

# aliases
alias zc="nvim ~/.zshrc"
alias zs="source ~/.zshrc"
alias ls="exa"
alias ll="exa -la"
alias ts="tmux source ~/.config/tmux/tmux.conf"
alias ac="nvim ~/.config/alacritty/alacritty.toml"
# starship
eval "$(starship init zsh)"

# fnm
export PATH="/home/mahi/.local/share/fnm:$PATH"
eval "$(fnm env)"

# fzf search
source <(fzf --zsh)

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt extendedhistory
setopt histignorealldups
setopt histignorespace
setopt histignoredups
setopt histreduceblanks

# pnpm
export PNPM_HOME="/home/mahi/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PATH=$HOME/.local/bin:$PATH
