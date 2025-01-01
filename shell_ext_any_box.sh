# Designed to be used on both dev and production servers
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

# ###############################################################################
# # Prompt
# ###############################################################################

if [ -n $IN_NIX_SHELL ]; then
  parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
  }

  # if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  #   host="\[\e[01;35m\]\u@\h\[\e[0m\]"
  # else
  #   host="\[\e[01;30m\]\h\[\e[0m\]"
  # fi

  # if [ -n "$IN_NIX_SHELL" ]; then
  #   subshell="==NIX"
  # else
  #   subshell=""
  # fi

  export PS1="\[\e[1;36m\]NIX \[\e[0m\]\w\[\e[01;32m\]\$(parse_git_branch)\[\e[0m\] $ \[\e[0m\]"
fi

###############################################################################
# General
###############################################################################

alias ll='ls -lFh'
alias lla='ls -lFah'
alias llt='ls -lhFart'

alias a=alias

alias br='bin/run'

# eg "ga rake" to see all rake-related aliases
function ga {
  alias | grep "$1" | grep -v grep
}

alias pg='ping www.google.com'

# eg "psg mysql" to see all mysql processes
function psg {
  ps wwwaux | egrep "($1|%CPU)" | grep -v grep
}

# eg "port 3000" to see what is running there
function port {
  lsof -i -n -P | grep TCP | grep "$1"
}

# Display folder and it's content as a tree
function tree {
  find ${1:-.} -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'
}

if [ $OSTYPE = 'linux-gnu' ]; then
  export EDITOR=$(which nano)
fi

# GIT
alias g=git
alias wip='git commit -m WIP'
export GIT_DUET_CO_AUTHORED_BY=1

# rsync
alias rsink='rsync --archive --verbose --progress --human-readable'
#alias rsink='rsync --archive --compress --verbose --progress --human-readable'
alias rsinkd='rsink --delete'

alias hk=heroku

alias ebp='$EDITOR ~/.zshrc'
alias ezsh='$EDITOR ~/.zshrc'
alias ebpe='$EDITOR ~/.dev_env'
alias ezshe='$EDITOR ~/.dev_env'
alias szsh='. ~/.zshrc'
alias sbp='. ~/.zshrc'
alias mdkir='mkdir'

# aider

alias aidson='aider --map-tokens 2048 --model claude-3-5-sonnet-20240620 --weak-model claude-3-5-sonnet-20240620 --anthropic-api-key="${ANTHROPIC_API_KEY_AIDER}"'
alias aid4o='aider --map-tokens 2048 --model="gpt-4o" --weak-model="gpt-4o" --openai-api-key="${OPENAI_API_KEY_AIDER}"'
alias aid40=aid4o

###############################################################################
# Yarn
###############################################################################

alias yup='yarn upgrade --force --latest'

alias y='yarn'
alias yt='yarn test'
alias yr='yarn run'

function yi {
  yarn add $*
}
function ya {
  yarn add $*
}
function yad {
  yarn add $* --dev
}

###############################################################################
# NPM
###############################################################################

alias nbump='npm version patch'
alias npub='npm version patch && git push --tags origin HEAD && npm publish'
alias nup='ncu --upgrade && npm update && npm prune' # if this fails:  `npm upgrade -g npm-check-updates`
alias n='npm'
alias nt='npm test'
alias nr='npm run'
alias ne='npm exec'
alias links='ll node_modules | grep \\-\>'

function ni {
  npm install $1 && npm prune
}
function nis {
  npm install --save $1 && npm prune
}
function nid {
  npm install --save-dev $1 && npm prune
}

function nv {
  npm show $1 versions
}

###############################################################################
# Ruby
###############################################################################

# Bundler

alias be='bundle exec'
alias bi='bundle install'
alias biq='bi --quiet'
alias biw='bi --without=development:test'
alias bid='biw --deployment'
alias bis='gemrat --no-version' # implements missing `bundle install --save` -- requires you first `gem install gemrat`

# # Foreman

# alias frun='be foreman run'
# alias fcon='be foreman run irb'
# alias fser='biq && be rerun foreman start'

# Rails

alias sp='bin/rspec --color'
alias sn='sp --format documentation'
alias sf='sp --require fuubar --format Fuubar'

alias r='bin/rails'
alias rs='biq && be foreman run "rails server"'

alias rdr='r db:rebuild'
alias rdm='be rake db:migrate'
alias rtp='r db:test:prepare'
alias rds='r db:seed'

alias work='r jobs:work'

alias ss='spring stop'
