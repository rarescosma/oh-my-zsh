###-begin-wp-cli-completion-###

if type compctl &>/dev/null; then

  _wp_completion () {
    local words cur prev opts comm

    read -Ac words
    cur=${words[-1]}
    prev=${words[-2]}

    if [[ 'wp' == $prev ]]; then
      comm="wp --completions | cut -d ' ' -f 1 | tr '\n' ' '"
    else
      comm="wp --completions | grep '^$prev ' | cut -d ' ' -f 2- | tr '\n' ' '"
    fi

    if [[ 'create' == $prev ]]; then
      # https://github.com/zsh-users/zsh/blob/master/Completion/bashcompinit
      setopt bareglobqual
      reply=( ${IPREFIX}${PREFIX}*${SUFFIX}${ISUFFIX}(N) )
      setopt nobareglobqual
    else
      opts=$(eval $comm)
      reply=(${=opts})
    fi
  }

  compctl -K _wp_completion wp

fi

###-end-wp-cli-completion-###
