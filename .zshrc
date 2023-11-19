alias ctags-cpp='sudo ctags -R --c++-kinds=+p --fields=+iaS --extras=+q --language-force=C++ -o .tags .'
alias gs='git status'
alias la='ls -a'
alias ls='ls -lFhG'
alias mcurl='curl -L -O -C - -f  --retry-all-errors --retry-max-time 120'

alias mclang='clang main.c -o main'
alias mc='mclang'
alias mclang++='clang++ main.cpp -o main -std=c++17'
alias mc++='mclang++'

alias mffplay='ffplay -fs -autoexit'
alias mff='mffplay'

export CLICOLOR=1
export PATH='/usr/local/opt/postgresql@15/bin/:/Library/Frameworks/Python.framework/Versions/3.10/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/VMware Fusion.app/Contents/Public:/Library/Apple/usr/bin:/usr/local/bin'
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"
export PATH="$PATH:$HOME/bin"

iCloud="$HOME/Library/Mobile Documents/com~apple~CloudDocs/"
