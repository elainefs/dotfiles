# Navigation
alias ~='cd ~'
alias ..='cd ..'
alias gh='cd ~/Github/'
alias my='cd ~/Github/myNotebook/'
alias dow='cd ~/Downloads/'
alias doc='cd ~/Documentos/'
alias go='cd ~/Govone/'

# System
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias ll='ls -l'
alias la='ls -A'

# Docker
# Stop all containers
alias dk='docker kill $(docker ps -q)'
alias dgo='docker start my_elasticsearch my_redis2 my_postgres my_pgadmin my_rabbitmq'

# Git
alias gs='git status'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'

# Python - Django
alias pmr='python manage.py runserver'
alias pms='python manage.py shell'
alias pmm='python manage.py migrate'
alias av='source .venv/bin/activate'
alias dv='deactivate'

# brModelo
alias brModelo='cd /opt/brModelo && java -jar /opt/brModelo/brModelo.jar'

# XAMPP
alias xampp='sudo /opt/lampp/manager-linux-x64.run'

# Neovim
alias nv='nvim'
