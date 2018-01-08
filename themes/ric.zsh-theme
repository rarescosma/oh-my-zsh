# RIC - by Rareș Cosma <rares@getbetter.ro>

source $ZSH/vendor/zsh-kubectl-prompt/kubectl.zsh
_lineup=$'\e[1A'
_linedown=$'\e[1B'

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[red]%}?"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Colors are at the top so you can mess with those separately if you like.
# RIC_USER_="%{$fg[yellow]%}n%{$reset_color%}"
#RIC_HOST_=""
#RIC_DIR_="\ "

PROMPT="\
%{$fg[magenta]%}@%m%{$reset_color%} \
%{$fg[cyan]%}%~%{$reset_color%} \
\$(git_prompt_info)
%{$fg[gray]%}%(!.#.$) %(?..[%{$fg[red]%}%?%{$reset_color%}] )%{$reset_color%}"

RPROMPT='%{${_lineup}%}%{$fg[cyan]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}%{${_linedown}%}'
