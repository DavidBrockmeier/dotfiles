if [ -f ~/.profile ]; then
  source ~/.profile
fi

if [ -f ~/.protocol ]; then
  source ~/.protocol
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.local_settings ]; then
  source ~/.local_settings
fi

### environment variables
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vi

set -o emacs

if [ "$USER" == "Klas" ]; then
  export AT_HOME=1
  export AT_WORK=0
else
  export AT_HOME=0
  export AT_WORK=1
fi

if  [[ $SHELL == *bash ]];
then
  if [[ $BASH_VERSINFO == 4 ]]; then
    # bash shell options
    shopt -s autocd globstar
  fi

  ### prompt
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

  export PROMPT_DIRTRIM=3
  if [ -f /usr/local/share/liquidprompt ]; then
    . /usr/local/share/liquidprompt
  fi

  # ctrl-p and ctrl-n now searches history
  bind '"":history-search-backward'
  bind '"":history-search-forward'

  # this line is added by iTerm command "Install shell integration"
  test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
fi

### version managers
export PATH="$PATH:$(yarn global bin)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

eval "$(pyenv init -)"
# pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

export WORKON_HOME=~/.py_virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# ansible needs sqlite3
# macOS provides an older sqlite3.
#If you need to have this software first in your PATH run:
#  echo 'export PATH="/usr/local/opt/sqlite/bin:$PATH"' >> ~/.bash_profile
export PATH="/usr/local/opt/sqlite/bin:$PATH"
# For compilers to find this software you may need to set:
#    LDFLAGS:  -L/usr/local/opt/sqlite/lib
#    CPPFLAGS: -I/usr/local/opt/sqlite/include
# For pkg-config to find this software you may need to set:
#    PKG_CONFIG_PATH: /usr/local/opt/sqlite/lib/pkgconfig

# ansible also needed openssl
# If you need to have this software first in your PATH run:
#  echo 'export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"' >> ~/.bash_profile
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# For compilers to find this software you may need to set:
#    LDFLAGS:  -L/usr/local/opt/openssl@1.1/lib
#    CPPFLAGS: -I/usr/local/opt/openssl@1.1/include
# For pkg-config to find this software you may need to set:
#    PKG_CONFIG_PATH: /usr/local/opt/openssl@1.1/lib/pkgconfig

### aliases
eval "$(fasd --init auto)"
eval $(thefuck --alias)
. ~/.aliases
