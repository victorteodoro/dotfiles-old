# Ferramentas administrativas
alias install="sudo apt-get install"
alias update="sudo apt-get update"
alias fix-missing="sudo apt-get update --fix-missing"
alias upgrade="sudo apt-get upgrade"
alias dist-upgrade="sudo apt-get dist-upgrade"
alias purge="sudo apt-get purge"
alias autoremove="sudo apt-get autoremove"
alias autoclean="sudo apt-get autoclean"
alias refresh-ubuntu="update && upgrade -y && autoremove && autoclean"
alias add-repo="sudo add-apt-repository"
alias search="apt-cache search"

# Especificações do sistema
alias cpuinfo='cat /proc/cpuinfo'
alias freemem='free -h'
alias meminfo='cat /proc/meminfo' 

# Ferramentas auxiliares
alias wifi-search='sudo iwlist wlp2s0 scan'
alias wifi-restart='sudo systemctl restart NetworkManager'
alias wget-site='wget --no-clobber --page-requisites --html-extension --convert-links --restrict-file-names=windows'
alias ram-info='sudo dmidecode --type 17'

# Utilitários
alias mkcdir='mkdir -p -- "$1"; and cd -P -- "$1"'

# Ferramentas de desenvolvimento
alias python="python3"

# Programas
alias matlab='sudo bash /usr/local/MATLAB/R2017a/bin/matlab'
alias emacs='emacs -nw'

# Linguagens de programação
alias lua='lua5.3'
