alias cl='clear'
alias gc='git commit -a -m'
alias gp='git push'
alias gs='git status'
alias la='ls -a'
alias ls='ls -lFhG'
alias nj='ninja'
alias op='open *.app'
alias python='python3'
alias sql='sqlite3'
alias sz='source ~/.zshrc'
alias tman='tman.sh'

alias trash='~/bin/trash.sh'
alias mkhr='makehere.sh'

# Default macOS Vim.
alias dtclsh='/usr/bin/tclsh'
alias dvi='/usr/bin/vi'
alias dvim='/usr/bin/vim'

alias hpython3='/usr/local/bin/python3'
alias hruby='/usr/local/Cellar/ruby/3.2.2_1/bin/ruby'
alias htclsh='/usr/local/bin/tclsh'
alias tcl='htclsh'
# Homebrew versions which conflict with system-provided tools.
alias hvi='/usr/local/Cellar/vim/*/bin/vi'
alias hvim='/usr/local/Cellar/vim/*/bin/vim'

# My personal configurations.
# -R: recurse directories.
alias mctags='sudo ctags -R --c++-kinds=+p --fields=+iaS --extras=+q --language-force=C++ -o .tags .'

# -L, --location: Follow the request onto the last location.
# -O, --remote-name: Write output to a local file named like the remote file we get.
# -f, --fail: Fail silently.
alias mcurl='curl -L -O -C - -f  --retry-all-errors --retry-max-time 120'
alias mclang='clang main.c -o main'
alias mc='mclang'
alias mclang++='clang++ main.cpp -o main -std=c++17'
alias mc++='mclang++'

# -fs: full screen
# -autoexit: quit after video ends.
alias mffplay='ffplay -fs -autoexit'
alias mff='mffplay'

export CLICOLOR=1
export PATH='/usr/local/opt/postgresql@15/bin/:/Library/Frameworks/Python.framework/Versions/3.10/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/VMware Fusion.app/Contents/Public:/Library/Apple/usr/bin:/usr/local/bin'

export PATH="/usr/local/opt/postgresql@15/bin:$PATH"
# Add my bin directory.
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:/Library/TeX/texbin"

icloud="$HOME/Library/Mobile Documents/com~apple~CloudDocs/"
projects="$HOME/Desktop/projects"
