# prompt style and colors based on Steve Losh's Prose theme:
# http://github.com/sjl/oh-my-zsh/blob/master/themes/prose.zsh-theme
#
# vcs_info modifications from Bart Trojanowski's zsh prompt:
# http://www.jukie.net/bart/blog/pimping-out-zsh-prompt
#
# git untracked files modification from Brian Carper:
# http://briancarper.net/blog/570/git-info-in-your-zsh-prompt

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}
PR_GIT_UPDATE=1

setopt prompt_subst
autoload colors
colors

autoload -U add-zsh-hook
autoload -Uz vcs_info

#use extended color pallete if available
if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    turquoise="%F{81}"
    orange="%F{166}"
    purple="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
else
    turquoise="$fg[cyan]"
    orange="$fg[yellow]"
    purple="$fg[magenta]"
    hotpink="$fg[red]"
    limegreen="$fg[green]"
fi

# enable VCS systems you use
zstyle ':vcs_info:*' enable git svn

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true

# set formats
# %b - branchname
# %u - unstagedstr (see below)
# %c - stagedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository
PR_RST="%{${reset_color}%}"
FMT_BRANCH="(%{$turquoise%}%b%u%c${PR_RST})"
FMT_ACTION="(%{$limegreen%}%a${PR_RST})"
FMT_UNSTAGED="%{$orange%}●"
FMT_STAGED="%{$limegreen%}●"

zstyle ':vcs_info:*:prompt:*' unstagedstr   "${FMT_UNSTAGED}"
zstyle ':vcs_info:*:prompt:*' stagedstr     "${FMT_STAGED}"
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}"
zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""


function steeef_preexec {
    case "$(history $HISTCMD)" in
        *git*)
            PR_GIT_UPDATE=1
            ;;
        *svn*)
            PR_GIT_UPDATE=1
            ;;
    esac
}
add-zsh-hook preexec steeef_preexec

function steeef_chpwd {
    PR_GIT_UPDATE=1
}
add-zsh-hook chpwd steeef_chpwd

function steeef_precmd {
    if [[ -n "$PR_GIT_UPDATE" ]] ; then
        # check for untracked files or updated submodules, since vcs_info doesn't
        if git ls-files --other --exclude-standard --directory 2> /dev/null | grep -q "."; then
            PR_GIT_UPDATE=1
            FMT_BRANCH="(%{$turquoise%}%b%u%c%{$hotpink%}●${PR_RST})"
        else
            FMT_BRANCH="(%{$turquoise%}%b%u%c${PR_RST})"
        fi
        zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"

        vcs_info 'prompt'
        PR_GIT_UPDATE=
    fi
}
add-zsh-hook precmd steeef_precmd

# Stary #
#PROMPT=$'
#%{\e{\e[0;33m%}'%D{"%A %d %B, %H:%M"}%b$'%{\e{\e[0m%} / %{$purple%}%n%{$reset_color%} @ %{$orange%}%m%{$reset_color%} in %{$limegreen%}%~%{$reset_color%} $vcs_info_msg_0_
#$(virtualenv_info)> '

# Nowy #
#PROMPT="
#${usercolour}┌─[${dircolour}%n${PR_NO_COLOR}«»`prompt_hostname`${usercolour}]─────────────────────────${dircolour}[%~]${at_normal} `prompt_current_branch &>/dev/null && echo -n $git`
#${usercolour}└─${sadface}${usercolour}${dircolour}(%T)(%l)${usercolour} coruscant ─╼ ${at_normal}"}

# Nowy + stary #

# DOBRY #
#PROMPT=$'
#┌─[%{\e{\e[0;33m%}'%D{"%A %d %B, %H:%M"}%b$'%{\e{\e[0m%} / %{$purple%}%n%{$reset_color%} @ %{$orange%}%m%{$reset_color%} in %{$limegreen%}%~%{$reset_color%} $vcs_info_msg_0_
#└─[$(virtualenv_info)> '

#bk
#PROMPT=$'
#┌─ %{\e{\e[0;33m%}'%D{"%A %d %B, %H:%M"}%b$'%{\e{\e[0m%} # %{$purple%}%n%{$reset_color%} @ %{$orange%}%m%{$reset_color%} in %{$limegreen%}%~%{$reset_color%} $vcs_info_msg_0_
#└─$(virtualenv_info)> '

#bk
#PROMPT=$'
#┌─ %{\e{\e[0;33m%}'%D{"%A %d %B, %H:%M"}%b$'%{\e{\e[0m%} # %{$purple%}%n%{$reset_color%} @ %{$orange%}%m%{$reset_color%} in %{$limegreen%}%~%{$reset_color%} $vcs_info_msg_0_
#└─$(virtualenv_info)> '

# primary prompt
PROMPT='$FG[237]------------------------------------------------------------%{$reset_color%}
$FG[032]┌─ '$' %{$purple%}%n%{$reset_color%} @ %{$orange%}%m%{$reset_color%} in %{$limegreen%}%~%{$reset_color%} $vcs_info_msg_0_ \
$FG[032]%(!.#.└─$(virtualenv_info)»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'
eval my_white='$FG[white]'

# right prompt
#RPROMPT='$my_gray%D{%A %d %B, %H:%M} %n@%m%{$reset_color%}%'
#RPROMPT='$my_gray%D{%A %d %B, %H:%M}%{$reset_color%}%'
RPROMPT='$my_gray%D{%A %d %B}%{$reset_color%} %D{%H:%M}'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075] (branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
