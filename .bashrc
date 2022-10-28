# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Codespaces bash prompt theme
__bash_prompt() {
    local userpart='`export XIT=$? \
        && [ ! -z "${GITHUB_USER}" ] && echo -n "\[\033[0;32m\]@${GITHUB_USER} " || echo -n "\[\033[0;32m\]\u " \
        && [ "$XIT" -ne "0" ] && echo -n "\[\033[1;31m\]➜" || echo -n "\[\033[0m\]➜"`'
    local gitbranch='`\
        if [ "$(git config --get codespaces-theme.hide-status 2>/dev/null)" != 1 ]; then \
            export BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null); \
            if [ "${BRANCH}" != "" ]; then \
                echo -n "\[\033[0;36m\](\[\033[1;31m\]${BRANCH}" \
                && if git ls-files --error-unmatch -m --directory --no-empty-directory -o --exclude-standard ":/*" > /dev/null 2>&1; then \
                        echo -n " \[\033[1;33m\]✗"; \
                fi \
                && echo -n "\[\033[0;36m\]) "; \
            fi; \
        fi`'
    local lightblue='\[\033[1;34m\]'
    local removecolor='\[\033[0m\]'
    PS1="${userpart} ${lightblue}\w ${gitbranch}${removecolor}\$ "
    unset -f __bash_prompt
}
__bash_prompt
export PROMPT_DIRTRIM=4



# Application Setup

export APP_CONFIG_PATH=/workspaces/config_sample_v5
export INDEX_FILE_ATTACHMENTS=true
export DISABLE_SECURE_COOKIES=true
export DISABLE_ES_SNAPSHOT=true
export ES_USER=elastic
export ES_PASS=changeme
export YF_ENABLED=false
export DISABLE_DB_BACKUP=true
export DISABLE_CONFIG_BACKUP=true
export DEV_SERVER=true
export NODE_ENV=development
export SOURCE_MAP=1


# Yellowfin

#export YF_ENABLED=true
export YF_URL=https://report03.i-sightlab.com
export YF_URL_SVC=http://10.25.28.4:8888
export YF_USER=admin@yellowfin.com.au
export YF_PASSWORD=test
export YF_ORG_ID=1
export YF_ORG=fchoi
export YF_DATASOURCE_HOST=10.25.29.9


# Direct
#export MAIL_TRANSPORT=direct
#export MAILSRV_DOMAIN=localhost.local

# SMTP
#export MAIL_TRANSPORT=smtp
#export MAILSRV_DOMAIN=cec000425.i-sightlab.com
#export MAIL_FROM=info@cec000425.i-sightlab.com
#export MAIL_HOST=mail01.i-sightstg.com

# MailDev (http://127.0.0.1:1080)
export MAIL_TRANSPORT=false
export MAILSRV_PORT=1025
export MAIL_PORT=1025

# Other
export MAIL_IGNORE_TLS=true
export MAIL_DISABLE_DNS_VALID=true
export MAIL_DISABLE_STARTTLS=true
export PROXY=false
export ALLOWED_REFERERS=true
export SLEEP_TIME=2
export FORCE_ESCALATION_DELAY=1000
export LOG_LEVEL=info
export SOURCE_MAP=false
export REDIS_TIMEOUT=0
export TEST_RABBIT_MQ_VHOST=%2F
#export PURGE_DELAY_UNIT=m
#export PURGE_DELAY=1
#export PURGE_CRON_EXPRESSION="0 0/1 * * * ? *"
#export FIELDS_MEMORY_CACHE_TTL_MS=1000
#export CLIENT_PULSE_INTERVAL=1800000 # 30 minutes
export SSE_DISABLED=false
#export ES_REFRESH_INTERVAL=1s
export BULK_IMPORT_ES_REFRESH=true

export ENABLE_PDFTRON=false
export PDFTRON_LICENSE_KEY=demo:1632222196165:78c697490300000000f5d3a237b5cd40a89c7d0666c041d730d9906ad6

# Mapping
export ENABLE_GEO_MAPPING=true
export GEO_MAPPING_PROXY_MODE=true
export GEO_MAPPING_FRONTEND_KEY=pk.eyJ1IjoiaXNpZ2h0YWRtaW4iLCJhIjoiY2wxcDQzdDZpMTlxdTNsbW1nMDB3OXR5diJ9.y_Wx_GdZqWAwLa5SnHYDnQ
export GEO_MAPPING_SECRET_KEY=pk.eyJ1IjoiaXNpZ2h0YWRtaW4iLCJhIjoiY2wxcDQzdDZpMTlxdTNsbW1nMDB3OXR5diJ9.y_Wx_GdZqWAwLa5SnHYDnQ
export GEO_MAPPING_ACCESS_TOKEN_HASH=localdev