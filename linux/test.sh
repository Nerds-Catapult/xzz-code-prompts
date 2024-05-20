#!/bin/bash

# Define colors
NC='\033[0m' # No Color
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'


evaluate_test () {
  eval "$1" && printf "${GREEN}pass${NC}\n" || printf "${RED}fail${NC}\n"
}


print_table_results () {
  local result=$(evaluate_test "$2")
  printf "%-30s => [ %-6s ]\n" "$1" "$result"
}

delimiter () {
  printf "${BLUE}******************************************${NC}\n"
}

validation_header () {
  printf "\n${CYAN}************ VALIDATING SETUP ************${NC}\n\n"
}


validation_header
delimiter

print_table_results "VSCode installed" "command -v code >/dev/null 2>&1"

print_table_results "NVM installed" "command -v nvm >/dev/null 2>&1"


print_table_results "Node installed" "command -v node >/dev/null 2>&1"

print_table_results "Python3 installed" "command -v python3 >/dev/null 2>&1"


print_table_results "pyenv installed" "command -v pyenv >/dev/null 2>&1"


print_table_results "pipx installed" "command -v pipx >/dev/null 2>&1"


print_table_results "pipenv installed" "command -v pipenv >/dev/null 2>&1"


print_table_results "git installed" "command -v git >/dev/null 2>&1"

print_table_results "Github user config" "command -v git >/dev/null 2>&1 && git config --list | grep -q 'user.name='"
print_table_results "Github email config" "command -v git >/dev/null 2>&1 && git config --list | grep -q 'user.email='"

delimiter


echo "Github User Configuration:"
evaluate "command -v git >/dev/null 2>&1 && git config user.name"
evaluate "command -v git >/dev/null 2>&1 && git config user.email"
delimiter


print_table_results "pyenv init in bashrc" "grep -q 'pyenv init' ~/.bashrc"


echo -e "${CYAN}Please close and reopen your terminal to apply the changes.${NC}"
delimiter
