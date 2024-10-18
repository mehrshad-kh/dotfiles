alias cl='clear'

# -i: Cause cp to write a prompt before copying a file that would overwrite an existing file.
alias cp='cp -i'
alias du='du -sh'
alias gc='git commit -a -m'
alias gf='git fetch'
alias gp='git push'
alias gs='git status'
alias la='ls -a'
alias ln='ln -is'
alias ls='ls -lFhG'
alias mdc='movies download current'
alias mdn='movies download next'
alias mp='movies play'
alias mv='mv -i'
alias sz='source ~/.zshrc'
alias vvi='vim ~/.vimrc'
alias vzs='vim ~/.zshrc'

alias llvm-mca='/usr/local/Cellar/llvm/*/bin/llvm-mca'
alias sql='sqlite3'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

# Script shortcuts
alias chrono='chrono.sh'
alias cotex='compile_tex.sh'
alias tman='tman.sh'
alias trash='trash.sh'
alias makehere='makehere.sh'
alias mcurl='mcurl.sh'
alias mkhr='makehere'
alias note='note.sh'
alias ip='myip.sh'
alias vilen='vilen.sh'

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
export PATH="/usr/local/opt/ruby/bin:$PATH"

# export PATH="/usr/local/opt/postgresql@15/bin:$PATH"

# Add user bin directory.
export PATH="$PATH:$HOME/bin"

# TeX
export PATH="$PATH:/Library/TeX/texbin"

# Qt
export PATH="$PATH:$HOME/Qt/6.5.2/macos/bin/"

# Remote folders.
icloud="$HOME/Library/Mobile Documents/com~apple~CloudDocs/"

# Local folders.
db="$HOME/Documents/Databases"
movies="$HOME/Movies/Mine/movies"
export notes="$HOME/Desktop/notes"
prj="$HOME/Desktop/projects"
series="$HOME/Movies/Mine/series"
