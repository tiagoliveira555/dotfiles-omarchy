HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE
setopt AUTO_CD

SPACESHIP_PROMPT_ORDER=(
    user
    dir
    host
    git
    hg
    exec_time
    line_sep
    jobs
    exit_code
    char
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

zinit snippet OMZP::git
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -Uz compinit && compinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[OA' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[OB' down-line-or-beginning-search

command -v fzf >/dev/null && source <(fzf --zsh)

zinit light spaceship-prompt/spaceship-prompt

zinit light zdharma-continuum/fast-syntax-highlighting

command -v mise >/dev/null && eval "$(mise activate zsh)"

alias sail='bash vendor/bin/sail'
alias pest='./vendor/bin/pest'
alias pint='./vendor/bin/pint'
alias a='php artisan'
alias s='sail'
alias sa='sail art'
alias m='sa migrate'
alias mfs='sa migrate:fresh --seed'
alias su='s up -d'
alias sd='sail down'
alias up-actions='sa ide-helper:actions'
alias dev='s npm run dev'
alias build='s npm run build'
alias saoc='sa optimize:clear'
alias wip='git add . && git commit -m "wip"'
alias sud='su && dev'
alias sahs='sa horizon:status'
alias saht='sa horizon:terminate'
