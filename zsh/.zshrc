# Arquivo onde o histórico será salvo
HISTFILE=~/.zsh_history

# Tamanho do histórico salvo no arquivo
HISTSIZE=10000           # quantos comandos guardar na sessão atual
SAVEHIST=10000           # quantos comandos salvar no arquivo .zsh_history

# Comportamento do histórico
setopt APPEND_HISTORY        # não sobrescreve, apenas adiciona no final do .zsh_history
setopt INC_APPEND_HISTORY    # escreve comandos no arquivo imediatamente
setopt HIST_IGNORE_ALL_DUPS  # ignora comandos duplicados
setopt HIST_REDUCE_BLANKS    # remove espaços desnecessários
setopt SHARE_HISTORY         # compartilha histórico entre várias sessões

if [[ $- == *i* ]]; then
    fastfetch
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.9

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
zinit light romkatv/powerlevel10k

#VIM MODE
ZVM_LINE_INIT_MODE='$ZVM_MODE_NORMAL'         
ZVM_VI_INSERT_ESCAPE_BINDKEY='jk'          
ZVM_CURSOR_STYLE_ENABLED=true               
ZVM_STATUSLINE_ENABLE=true

zinit light jeffreytse/zsh-vi-mode

#other utils
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
#zinit light hlissner/zsh-autopair

#fzf
zinit light junegunn/fzf
#binds fzf
if [[ -f ~/.local/share/zinit/plugins/junegunn---fzf/shell/key-bindings.zsh ]]; then
  source ~/.local/share/zinit/plugins/junegunn---fzf/shell/key-bindings.zsh
fi

if [[ -f ~/.local/share/zinit/plugins/junegunn---fzf/shell/completion.zsh ]]; then
  source ~/.local/share/zinit/plugins/junegunn---fzf/shell/completion.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ls='eza --icons=always'
alias v='nvim'

export FZF_DEFAULT_OPTS='
  --height=60%
  --layout=reverse
  --border
  --preview="[[ -f {} ]] && bat --style=numbers --color=always --line-range :500 {} || [[ -d {} ]] && eza --tree --icons {}"
  
'

if [ -f ~/.zshrc.local ]; then source ~/.zshrc.local; fi
