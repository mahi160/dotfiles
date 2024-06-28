export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# aliases
alias zc="nvim ~/.zshrc"
alias zs="source ~/.zshrc"
alias ls="exa"
alias code="code-insiders"

# starship
eval "$(starship init zsh)"

# fnm
export PATH="/home/mahi/.local/share/fnm:$PATH"
eval "`fnm env`"

# fzf search
source <(fzf --zsh)

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory