# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="candy-mod-v1_by_zse1"
#ZSH_THEME="steeefv5"
#ZSH_THEME="aussiegeek"
#ZSH_THEME="candy"
#ZSH_THEME="frisk" dobre ale trzeba przerobic
#ZSH_THEME="xiong-chiamiov"
#ZSH_THEME="af-magic v4 by zse1"
#ZSH_THEME="steeefv6b"
ZSH_THEME="steeefv6a"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git wakeonlan extract)

# Plugin odpowiadający za historię
source $ZSH/oh-my-zsh.sh
source $ZSH/plugins/history-substring-search/history-substring-search.zsh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl

# Własne ustawienia
# Historia
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e

# Dopełnianie komend
autoload -U compinit
compinit

# Poprawianie komend
setopt correctall

# Jeśli udało Ci się wpisać polecenie z błędem, zsh spróbuje je poprawić
setopt CORRECT

# Automatyczne przechodzenie do katalogów
setopt AUTO_CD

# Data w normalnym formacie dzień-miesiąc-rok
DATE=$(date +'%d-%m-20%y')

# Autouzupełnianie aliasów
setopt completealiases

# Usuwanie duplikatów z historii
setopt hist_ignore_all_dups

# Klawisze
                bindkey "^[[7~" beginning-of-line #Home key
                bindkey "^[[8~" end-of-line #End key
                bindkey "^[[1~" beginning-of-line #Home key
                bindkey "^[[4~" end-of-line #End key
                bindkey "^[[3~" delete-char #Del key
                bindkey "^[[A" history-beginning-search-backward #Up Arrow
                bindkey "^[[B" history-beginning-search-forward #Down Arrow
                bindkey "^[Oc" forward-word # control + right arrow
                bindkey "^[Od" backward-word # control + left arrow
                bindkey "^H" backward-kill-word # control + backspace
                bindkey "^[[3^" kill-word # control + delete

##bindkey "^R" history-incremental-pattern-search-backward 
##bindkey "^S" history-incremental-pattern-search-forward

# Ustawia kursor na końcu po wybraniu komendy z historii
function history-search-end {
  integer ocursor=$CURSOR

  if [[ $LASTWIDGET = history-beginning-search-*-end ]]; then
    # Last widget called set $hbs_pos.
    CURSOR=$hbs_pos
  else
    hbs_pos=$CURSOR
  fi

  if zle .${WIDGET%-end}; then
    # Success: Go to end of line.
    zle .end-of-line
  else
    # Failure: Restore position.
    CURSOR=$ocursor
    return 1
  fi
}
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Bind the up and down arrows to history search.
#bindkey '\e[A' history-beginning-search-backward-end
#bindkey '\e[B' history-beginning-search-forward-end

# Zaawansowana historia
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down

## Aliasy

# Edytor:
alias vi='vim'
alias v='vim'

# Hibernacja
alias hibernate='pm-hibernate'
 
# Inne
#alias ls='ls -hF --color=auto'
#alias la='ll -A'
#alias lx='ll -BX'                   # sort by extension
#alias lz='ll -rS'                   # sort by size
#alias lt='ll -rt'                   # sort by date
 
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -lha --color=auto'
alias lx='ls -lhBX --color=auto'        #sort by extension
alias lz='ls -lhrS --color=auto'        #sort by size
alias lt='ls -lhrt --color=auto'        #sort by date
alias lr='ls -lhR --color=auto'                    # recursive ls
alias lm='la | more'
alias skrypt='sh "/home/sebastian/.skrypty/Inne/Przydatne narzędzia 2.0.sh"'
alias rss='newsbeuter'
alias sshserwerdom='ssh -i /home/sebastian/.ssh/id_rsa_serwer_dom zse1@192.168.1.5 -p 10025'
alias sshmydevil='ssh -i /home/sebastian/.ssh/id_rsa_shell_mydevil sebas87@ssh.mydevil.net'
alias sshendomedk='ssh -i /home/sebastian/.ssh/id_rsa_serwer_endomedk mareczekg@IP -p 10025'
alias redshifton='nohup redshift -l 51.3:21.2 -t 5600:4400 -b 0.8 > /dev/null 2>&1&'
alias redshiftoff='killall redshift &'
#alias gitup='cd .goral20-files && git init && git add . -A && git commit -v && git push -u goral20 master && cd ..'
alias gitcom='cd ~ && cd .goral20-files && git init && git add . -A && git commit -v && cd ..'
alias gitup='cd ~ && cd .goral20-files && git push -u goral20 master && cd ..'
alias streamw='sh .skrypty/Inne/streamw.sh'
