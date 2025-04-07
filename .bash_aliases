# Navigation
alias ~='cd ~'
alias gh='cd ~/Github/'
alias my='cd ~/Github/myNotebook/'
alias dl='cd ~/Downloads/'
alias dc='cd ~/Documentos/'
alias go='cd ~/Govone/'

# Docker
alias dk='docker kill $(docker ps -q)' # Stop all containers
alias dgo='docker start my_elasticsearch my_redis2 my_postgres my_pgadmin my_rabbitmq'


# Git
alias gs='git status'
alias gc='git checkout'
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
