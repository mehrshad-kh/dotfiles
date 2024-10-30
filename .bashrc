# Load common rc file.
[[ -r ~/.shellrc ]] && source ~/.shellrc

# Set shell prompt.
# Same as zsh prompt on macOS.
export PS1='\u@\h \W $ '

# Do not auto-complete hidden files.
bind 'set match-hidden-files off'

# Set Linux-specific options.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias mvivado='sudo /tools/Xilinx/Vivado/2023.2/bin/vivado'
fi

alias sb='source ~/.bashrc'
