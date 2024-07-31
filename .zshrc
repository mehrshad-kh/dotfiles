alias cl='clear'

# -i: Cause cp to write a prompt before copying a file that would overwrite an existing file.
alias cp='cp -i'
alias gc='git commit -a -m'
alias gf='git fetch'
alias gp='git push'
alias gs='git status'
alias la='ls -a'
alias ls='ls -lFhG'
alias mv='mv -i'
alias sz='source ~/.zshrc'

alias llvm-mca='/usr/local/Cellar/llvm/*/bin/llvm-mca'
alias sql='sqlite3'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

alias chrono='chrono.sh'
alias tman='tman.sh'
alias trash='trash.sh'
alias makehere='makehere.sh'
alias mcurl='mcurl.sh'
alias mkhr='makehere'
alias cotex='compile_tex.sh'

# -fs: full screen
# -autoexit: quit after video ends.
alias mffplay='ffplay -fs -autoexit -loglevel warning -stats'
alias mff='mffplay'

# Default macOS Vim.
alias dtclsh='/usr/bin/tclsh'
alias dvi='/usr/bin/vi'
alias dvim='/usr/bin/vim'

alias hpython3='/usr/local/bin/python3'
alias hruby='/usr/local/Cellar/ruby/*/bin/ruby'
alias htclsh='/usr/local/bin/tclsh'
alias tcl='htclsh'

# Homebrew versions which conflict with system-provided tools.
alias hvi='/usr/local/Cellar/vim/*/bin/vi'
alias hvim='/usr/local/Cellar/vim/*/bin/vim'

export CLICOLOR=1
export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.10/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/Applications/VMware Fusion.app/Contents/Public"
export PATH="$PATH:/Library/Apple/usr/bin"
export PATH="$PATH:/usr/local/bin"

# export PATH="/usr/local/opt/postgresql@15/bin:$PATH"

# Add user bin directory.
export PATH="$PATH:$HOME/bin"

# TeX
export PATH="$PATH:/Library/TeX/texbin"

# Remote folders.
icloud="$HOME/Library/Mobile Documents/com~apple~CloudDocs/"

# Local folders.
db="$HOME/Documents/Databases"
movies="$HOME/Movies/Mine/movies"
notes="$HOME/Desktop/notes"
prjcts="$HOME/Desktop/projects"
series="$HOME/Movies/Mine/series"

eval "$(rbenv init - zsh)"
# LDFLAGS="-L/usr/local/opt/llvm/lib/c++ -Wl,-rpath,/usr/local/opt/llvm/lib/c++"
