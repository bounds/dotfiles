export ZSH=$HOME/.oh-my-zsh
export GOPATH="$HOME/go"
export HOMEBREW_PATH=$(brew --prefix)


export PATH="$HOMEBREW_PATH/bin:$HOME/.rbenv/shims:$PATH:$HOME/.foundry/bin:$GOPATH/bin:$HOME/.cargo/bin"
export PATH="$HOMEBREW_PATH/bin:$PATH:$HOMEBREW_PATH/opt/node@16/bin"
export PATH="$HOME/.ebcli-virtual-env/executables:$PATH"

export HOMEBREW_NO_ENV_HINTS=true
export EDITOR='nvim'

eval "$(starship init zsh)"
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

plugins=(
  z
  cmdtime
  zsh-syntax-highlighting
  brew
  ipfs
  docker
  docker-compose
  tmux
  yarn
  npm
  fancy-ctrl-z
  aws
  macos
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# Must be down here because omz overwrites
alias ls='ls -Gltra'
alias vim='nvim'
alias t2='tree -L 2'
alias lg='lazygit'
alias source_zshrc='source ~/.zshrc'
alias find_text='grep -r -n --exclude-dir={node_modules,build,out,cache,artifacts,dist,.next}'

export PATH="$PATH:/Users/dave/.huff/bin"
