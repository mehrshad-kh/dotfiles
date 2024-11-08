# Load common rc file.
# If the file in readble, then
if [[ -r ~/.shellrc ]]; then
  # Read it.
  source ~/.shellrc
else
  # Print error output otherwise.
  echo >&2 'error: ~/.shellrc could not be found'
fi

# Customize bash prompt
export PS1='\u@\h \W $ '

# Do not auto-complete hidden files.
bind 'set match-hidden-files off'

# Set Linux-specific options.
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  alias mvivado='sudo /tools/Xilinx/Vivado/2023.2/bin/vivado'
fi

alias sb='source ~/.bashrc'
