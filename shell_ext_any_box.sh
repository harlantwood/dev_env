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

###############################################################################
# Basics
###############################################################################

alias ll='ls -lFh'
alias lla='ls -lFah'
alias llt='ls -lhFart'

alias a=alias

# eg "ga rake" to see all rake-related aliases
function ga {
  alias | grep "$1" | grep -v grep
}

alias rsink='rsync --archive --compress --verbose --progress --human-readable'
alias rsinkd='rsink --delete'

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
  export EDITOR=`which nano`
fi

# GIT
alias g=git
alias wip='git commit -m WIP'

# rsync
alias rsink='rsync --archive --compress --verbose --progress --human-readable'
alias rsinkd='rsink --delete'

# ###############################################################################
# # Prompt
# ###############################################################################

# if [ $OSTYPE = 'linux-gnu' ]; then
#   export GIT_DUET_CO_AUTHORED_BY=1
#   parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
#   }

#   if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
#     host="\[\e[01;35m\]\u@\h\[\e[0m\]"
#   else
#     host="\[\e[01;30m\]\h\[\e[0m\]"
#   fi

#   if [ -n "$IN_NIX_SHELL" ]; then
#     subshell="==NIX"
#   else
#     subshell=""
#   fi

#   export PS1="${host} \w\[\e[01;32m\]\$(parse_git_branch)\[\e[0m\]\n\[\e[1;36m\]${subshell}==> $ \[\e[0m\]"
# fi

###############################################################################
# Yarn
###############################################################################

alias yup='npm-check-updates --upgrade && yarn && yarn upgrade'  # if this fails:  `npm upgrade -g npm-check-updates`

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
alias nup='ncu --upgrade && npm update && npm prune'  # if this fails:  `npm upgrade -g npm-check-updates`
alias n='npm'
alias nt='npm test'
alias nr='npm run'
alias links='ll node_modules | grep \\-\>'

function ni  {
  npm install            $1 && npm prune
}
function nis {
  npm install --save     $1 && npm prune
}
function nid {
  npm install --save-dev $1 && npm prune
}

function nv {
  npm show $1 versions
}
