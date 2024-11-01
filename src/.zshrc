# Load common rc file.
# If the file in readble, then
if [[ -r ~/.shellrc ]]; then
  # Read it.
  source ~/.shellrc
else
  # Print error output otherwise.
  echo >&2 'error: ~/.shellrc could not be found'
fi

alias sz='source ~/.zshrc'
