# Read and understand all of this that you use!
#
# As the license says:
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

###############################################################################
# Prompt
###############################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# HOMEBREW INSTALLATION LOCATION
if [[ $(uname -m) == 'arm64' ]]; then
    source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme # Apple M1 (arm64)
  else       
    source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme # Intel (x86_64)          
fi


# [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
# [[ -r "/usr/local/opt/git/etc/bash_completion.d/git-prompt.sh" ]] && . "/usr/local/opt/git/etc/bash_completion.d/git-prompt.sh"
# export DISABLE_UNTRACKED_FILES_DIRTY=false
# export GIT_PS1_SHOWDIRTYSTATE=true
# export GIT_PS1_SHOWCOLORHINTS=1
# export PROMPT_COMMAND='__git_ps1 "\W" "\\\$ "'
# export PROMPT_COMMAND='__git_ps1 "\w" "\[\e[0m\]\[\e[1;36m\] $ \[\e[0m\]"'

###############################################################################
# Imports
###############################################################################

# SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)  # works in bash
SCRIPT_DIR=${0:a:h} # zsh only

. ${SCRIPT_DIR}/shell_ext_any_box.sh

###############################################################################
# zsh
###############################################################################

if [[ $(uname -m) == 'arm64' ]]; 
  then
    export PATH="/opt/homebrew/bin:$PATH" # Apple M1 (arm64)
  else       
    export PATH="/usr/local/bin:$PATH" # Intel (x86_64)          
fi


# ###############################################################################
# # Go
# ###############################################################################

# export GOPATH="${HOME}/.go"
# export GOROOT="$(brew --prefix golang)/libexec"
# export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
# test -d "${GOPATH}" || mkdir "${GOPATH}"
# test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"

###############################################################################
# Basics
###############################################################################

# lots of history, available from all tabs and terminals:
export SAVEHIST=100000
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTFILE=~/.zhistory
if $(command -v setopt >/dev/null); then
  setopt SHARE_HISTORY
  setopt HIST_IGNORE_DUPS
  setopt INC_APPEND_HISTORY
  #setopt EXTENDED_HISTORY
fi

alias h='history -50'

# eg "hg multipass" to see all commands containing 'multipass'
function hg {
  history 1 | grep $1
}

# fixes https://github.com/asdf-vm/asdf/issues/279#issue-290858023
# and possibly other issues:
# touch $HOME/.bash_sessions_disable

ulimit -n 1024

# securely erase files before removing:
alias rms='rm -P'

# remove all .svn dirs in the current dir and subdirs
# alias rmsvn='find . -name ".svn" -exec rm -rf "{}" \;'
alias rmds='find . -name ".DS_Store" -exec rm -rf "{}" \;'

alias tbar='sudo killall TouchBarServer' # to get esc key back ;)

###############################################################################
# AWS
###############################################################################

alias ecs='ecs-cli'

###############################################################################
# Docker
###############################################################################

alias d='docker'
alias dc='docker-compose'
alias dnuke='docker container rm --force --volumes $(docker container ls --quiet --all) ; docker network rm $(docker network ls -q)'

###############################################################################
# Elixir / Erlang
###############################################################################

export ERL_AFLAGS="-kernel shell_history enabled"
alias m='mix'

###############################################################################
# OSX
###############################################################################

if [ $OSTYPE != 'linux-gnu' ]; then

  export PATH="$(echo $HOME)/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:/usr/local/lib:/usr/sbin:$PATH"

  export MANPATH=$MANPATH:/opt/local/man
  export EDITOR='code'
  alias vs=code

  # For homebrew-based mysql install:
  alias mystop='/usr/local/opt/mysql56/bin/mysql.server stop' #  ; killall mysqld'
  alias mystart='/usr/local/opt/mysql56/bin/mysql.server start'

  alias camera='sudo killall VDCAssistant || sudo killall AppleCameraAssistant'

  if type brew &>/dev/null; then
      FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

      autoload -Uz compinit
      compinit
  fi

  BREWFIX_FILES="\
    /Library/Ruby/Gems \
    /usr/local/Caskroom \
    /usr/local/Cellar \
    /usr/local/Homebrew \
    /usr/local/lib/pkgconfig \
    /usr/local/share \
    /usr/local/var/homebrew \
    /usr/local/var/log \
    "
  BREWFIX="sudo chown -R $(whoami) ${BREWFIX_FILES}"
  # BREWFIX="sudo chown -R $(whoami) ${BREWFIX_FILES} && sudo chmod -R g+w ${BREWFIX_FILES}"
  alias brewfix="${BREWFIX}"
  # eval $BREWFIX # fix on login # takes some time
fi

###############################################################################
# NVM
###############################################################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion

###############################################################################
# Ruby
###############################################################################

# rbenv:

eval "$(rbenv init -)"                #bash    
export PATH="$HOME/.rbenv/bin:$PATH"  #zsh
eval "$(rbenv init - zsh)"            #zsh

# ###############################################################################
# # asdf
# ###############################################################################

# . $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash

# . /usr/local/opt/asdf/asdf.sh
# . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

###############################################################################
# Holochain & nix
###############################################################################

# single user nix:
[ -f ~/.nix-profile/etc/profile.d/nix.sh ] && . ~/.nix-profile/etc/profile.d/nix.sh

# multi user nix:
# from https://github.com/NixOS/nix/issues/5298#issuecomment-928083070
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  # if PATH does *not* contain `~/.nix-profile/bin`
  if [ -n "${PATH##*.nix-profile/bin*}" ]; then

    # If this flag is set, `nix-daemon.sh` returns early
    # https://github.com/NixOS/nix/issues/5298
    unset __ETC_PROFILE_NIX_SOURCED
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
  fi
fi

export NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1  # for M1 macs, for now

alias nixs='nix-shell         --command "zsh" --argstr flavor happDev --command ". ~/.dev_env/shell_ext_any_box.sh; return"'
alias nixsp='nix-shell --pure --command "zsh" --argstr flavor happDev --command ". ~/.dev_env/shell_ext_any_box.sh; return"'
# alias nixs="nix-shell --run $SHELL --command '. ~/.zshrc; return' --argstr flavor happDev"
# alias nixh="nix-shell --command '. ~/.zshrc; return' https://github.com/holochain/holonix/archive/v0.0.65.tar.gz"
# alias love="nix-shell --command '. ~/.zshrc; return' https://holochain.love"
alias killnix="ps aux | grep nix | awk '{print $2}' | xargs kill -9"
alias nixclean="nix-store --gc && nix-collect-garbage -d"

###############################################################################
# Rust
###############################################################################

export PATH="$HOME/.cargo/bin:$PATH"
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

###############################################################################
# Python / ML
###############################################################################

###############################################################################
# Other
###############################################################################

alias hs='http-server -c-1'

# alias pjson='underscore print --color'

# alias pgstart='pg_ctl -D /usr/local/var/postgres start'
# alias pgstop='pg_ctl -D /usr/local/var/postgres stop'

export PATH="/usr/local/opt/postgresql@12/bin:$PATH"

# For compilers to find postgresql@12 you may need to set:
#   export LDFLAGS="-L/usr/local/opt/postgresql@12/lib"
#   export CPPFLAGS="-I/usr/local/opt/postgresql@12/include"

# For pkg-config to find postgresql@12 you may need to set:
#   export PKG_CONFIG_PATH="/usr/local/opt/postgresql@12/lib/pkgconfig"

#alias tomcat-start='/usr/local/Cellar/tomcat6/6.0.45/bin/startup.sh'
#alias tomcat-shutdown='/usr/local/Cellar/tomcat6/6.0.45/bin/shutdown.sh'
#alias tomcat-stop='/usr/local/Cellar/tomcat6/6.0.45/bin/shutdown.sh'

# This echoes a bunch of color codes to the terminal to demonstrate
# what's available. Each line is the color code of one forground color,
# out of 17 (default + 16 escapes), followed by a test use of that color
# on all nine background colors (default + 8 escapes).
# from http://bitmote.com/index.php?post/2012/11/19/Using-ANSI-Color-Codes-to-Colorize-Your-Bash-Prompt-on-Linux
#
function colors {
  T='XXX'
  echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m";
  for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' '  36m' '1;36m' '  37m' '1;37m';
    do FG=${FGs// /}
    echo -en " $FGs \033[$FG  $T  "
    for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
      do echo -en "$EINS \033[$FG\033[$BG  $T \033[0m\033[$BG \033[0m";
    done
    echo;
  done
  echo
}
