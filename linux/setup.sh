#!/bin/bash


NC='\033[0m' 
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'


install_package() {
  sudo apt-get install -y "$1"
}


is_command_available() {
  command -v "$1" >/dev/null 2>&1
}

evaluate_test () {
  eval "$1" && printf "${GREEN}pass${NC}\n" || printf "${RED}fail${NC}\n"
}


evaluate () {
  eval "$1"
}


print_table_results () {
  local result=$(evaluate_test "$2")
  printf "%-30s => [ %-6s ]\n" "$1" "$result"
}


print_data_row () {
  local result=$(evaluate "$2")
  printf "%-12s => [ %-6s ]\n" "$1" "$result"
}


delimiter () {
  printf "${BLUE}******************************************${NC}\n"
}

# Function to print validation header
validation_header () {
  printf "\n${CYAN}************ VALIDATING SETUP ************${NC}\n\n"
}

# Function to print configuration header
configuration_header () {
  printf "\n${CYAN}************* CONFIGURATION **************${NC}\n\n"
}


sudo apt update
sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev curl git libncursesw5-dev xz-utils tk-dev \
libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

validation_header
delimiter

if ! is_command_available "code"; then
  if is_command_available "snap"; then
    echo "Installing VSCode using snap..."
    sudo snap install code --classic
  fi
fi
print_table_results "Installed VSCode" "is_command_available 'code'"

if ! is_command_available "nvm"; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  . ~/.nvm/nvm.sh
fi
print_table_results "Installed NVM" "is_command_available 'nvm'"


if ! is_command_available "node"; then
  nvm install node
fi
print_table_results "Installed Node" "is_command_available 'node'"

if ! is_command_available "python3"; then
  install_package "python3"
fi
print_table_results "Installed Python3" "is_command_available 'python3'"

if ! is_command_available "pyenv"; then
  curl https://pyenv.run | bash
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
  echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
  echo 'eval "$(pyenv init -)"' >> ~/.bashrc
  . ~/.bashrc
fi
print_table_results "Installed pyenv" "is_command_available 'pyenv'"


if ! is_command_available "pipx"; then
  sudo apt update
  sudo apt install -y pipx
  pipx ensurepath
  sudo pipx ensurepath --global
fi
print_table_results "Installed pipx" "is_command_available 'pipx'"

if ! is_command_available "pipenv"; then
  sudo apt install pipenv -y
fi
print_table_results "Installed pipenv" "is_command_available 'pipenv'"


if ! is_command_available "git"; then
  install_package "git"
fi
print_table_results "Installed git" "command -v git >/dev/null 2>&1 && git version | grep -q 'git version'"
delimiter


configuration_header
delimiter


print_table_results "Github user config" "command -v git >/dev/null 2>&1 && git config --list | grep -q 'user.name='"
print_table_results "Github email config" "command -v git >/dev/null 2>&1 && git config --list | grep -q 'user.email='"
echo "Github User Configuration:"
print_data_row "Name" "command -v git >/dev/null 2>&1 && git config user.name"
print_data_row "Email" "command -v git >/dev/null 2>&1 && git config user.email"
delimiter


echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc


echo -e "${CYAN}Please close and reopen your terminal to apply the changes. Run sudo apt install pipenv -y afterwards${NC}"