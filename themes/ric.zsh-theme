# RIC - by Rareș Cosma <rares@getbetter.ro>
setopt prompt_subst
autoload -U add-zsh-hook

source $ZSH/vendor/zsh-kubectl-prompt/kubectl.zsh
_lineup=$'\e[1A'
_linedown=$'\e[1B'

# Colors are at the top so you can mess with those separately if you like.
RIC_USER_COLOR="%{$fg[yellow]%}"
RIC_HOST_COLOR="%{$fg[magenta]%}"
RIC_DIR_COLOR="%{$fg[cyan]%}"
RIC_PROMPT_COLOR="%{$fg[gray]%}"

RIC_GIT_BRANCH_COLOR="%{$fg[green]%}"
RIC_GIT_UNTRACKED_COLOR="%{$fg[red]%}"
RIC_GIT_DIRTY_COLOR="%{$fg[red]%}"

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX="$RIC_GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" $RIC_GIT_UNTRACKED_COLOR?"
ZSH_THEME_GIT_PROMPT_DIRTY=" $RIC_GIT_DIRTY_COLOR!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}

add-zsh-hook precmd _ric_theme_prompt_precmd
function _ric_theme_prompt_precmd() {
  RIC_USER_="$RIC_USER_COLOR%n%{$reset_color%}"
  RIC_HOST_="$RIC_HOST_COLOR@%m%{$reset_color%}"
  RIC_DIR_="$RIC_DIR_COLOR$(collapse_pwd) %{$reset_color%}\$(git_prompt_info) "
  PROMPT="$RIC_HOST_ $RIC_DIR_
$RIC_PROMPT_COLOR%(!.#.$) %{$reset_color%}"
}

RPROMPT='%{${_lineup}%}%{$fg[green]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}%{${_linedown}%}'
