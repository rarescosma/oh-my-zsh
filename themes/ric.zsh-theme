# RIC - by Rares Cosma <office@rarescosma.com>
#
# Colors are at the top so you can mess with those separately if you like.


RIC_RVM_COLOR="%{$fg[red]%}"
RIC_USER_COLOR="%{$fg[yellow]%}"
RIC_HOST_COLOR="%{$fg[magenta]%}"
RIC_DIR_COLOR="%{$fg[cyan]%}"
RIC_PROMPT_COLOR="%{$fg[white]%}"

RIC_GIT_BRANCH_COLOR="%{$fg[green]%}"
RIC_GIT_CLEAN_COLOR="%{$fg[green]%}"
RIC_GIT_DIRTY_COLOR="%{$fg[red]%}"

# These Git variables are used by the oh-my-zsh git_prompt_info helper:
ZSH_THEME_GIT_PROMPT_PREFIX="on $RIC_GIT_BRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN=" $RIC_GIT_CLEAN_COLOR✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" $RIC_GIT_DIRTY_COLOR✗"

# Our elements:
if which rvm-prompt &> /dev/null; then
	RIC_RVM_="$RIC_RVM_COLOR\${\$(~/.rvm/bin/rvm-prompt i v g)#ruby-}%{$reset_color%} for "
else
	RIC_RVM_=""
fi
RIC_USER_="$RIC_USER_COLOR%n%{$reset_color%}"
RIC_HOST_="$RIC_HOST_COLOR%m%{$reset_color%}"
RIC_DIR_="$RIC_DIR_COLOR%~ %{$reset_color%}\$(git_prompt_info) "
RIC_PROMPT="$RIC_PROMPT_COLOR➭ %{$reset_color%}"

# Put it all together!
PROMPT="$RIC_RVM_$RIC_USER_ at $RIC_HOST_ in $RIC_DIR_
$RIC_PROMPT"
