# RIC - by Rareș Cosma <rares@getbetter.ro>

source $ZSH/vendor/zsh-kubectl-prompt/kubectl.zsh

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[red]%}?"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# setopt PROMPT_SUBST
PROMPT='%4(L..%{$fg[magenta]%}@%m%{$reset_color%} )\
%{$fg[cyan]%}$ZSH_KUBECTL_PROMPT$(git_prompt_info)%{$fg[blue]%}%~%{$fg[default]%} %130(?..%(?..[%{$fg[red]%}%?%{$reset_color%}] ))%{$reset_color%}'
