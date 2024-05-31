#!/bin/sh

# ASCII Art for Git Messiah
echo "   ____ _ _       __  __           _     _       "
echo "  / ___(_) |_ ___|  \/  | ___   __| | __| | __ _ "
echo " | |  _| | __/ _ \ |\/| |/ _ \ / _\` |/ _\` |/ _\` |"
echo " | |_| | | ||  __/ |  | | (_) | (_| | (_| | (_| |"
echo "  \____|_|\__\___|_|  |_|\___/ \__,_|\__,_|\__,_|"
echo "                                                 "
echo "               Git Messiah                       "
echo ""

# Check if Git is installed
if ! command -v git > /dev/null 2>&1; then
    echo "Git is not installed. Please install Git and try again."
    exit 1
fi

# Prompt for repository name
printf "Enter the repository name: "
read repo_name

# Prompt for GitHub, GitLab, or Bitbucket
printf "Select your platform (1 for GitHub, 2 for GitLab, 3 for Bitbucket): "
read platform

# Set the appropriate remote URL base and branch name
case "$platform" in
    1)
        remote_base_url="github.com"
        branch_name="main"
        ;;
    2)
        remote_base_url="gitlab.com"
        branch_name="master"
        ;;
    3)
        remote_base_url="bitbucket.org"
        branch_name="master"
        ;;
    *)
        echo "Invalid platform specified. Please enter 1 for GitHub, 2 for GitLab, or 3 for Bitbucket."
        exit 1
        ;;
esac

# Prompt for credentials or use environment variables
if [ -z "$GIT_USERNAME" ]; then
    printf "Enter your Git username: "
    read git_username
else
    git_username=$GIT_USERNAME
    echo "Using Git username from environment variable."
fi

if [ -z "$GIT_TOKEN" ]; then
    printf "Enter your Git token: "
    stty -echo
    read git_token
    stty echo
    echo ""
else
    git_token=$GIT_TOKEN
    echo "Using Git token from environment variable."
fi

# Check if the repository already exists
case "$platform" in
    1)
        api_url="https://api.github.com"
        response=$(curl -s -w "%{http_code}" -o /dev/null -u "$git_username:$git_token" "$api_url/repos/$git_username/$repo_name")
        ;;
    2)
        api_url="https://gitlab.com/api/v4"
        response=$(curl -s -w "%{http_code}" -o /dev/null -H "Private-Token: $git_token" "$api_url/projects/$git_username%2F$repo_name")
        ;;
    3)
        api_url="https://api.bitbucket.org/2.0"
        response=$(curl -s -w "%{http_code}" -o /dev/null -u "$git_username:$git_token" "$api_url/repositories/$git_username/$repo_name")
        ;;
esac

if [ "$response" -eq 200 ]; then
    echo "Repository '$repo_name' already exists."
    exit 1
elif [ "$response" -ne 404 ]; then
    echo "Failed to check if repository exists. HTTP response code: $response"
    exit 1
fi

# Determine default directory
if [ "$(uname)" = "Linux" ] || [ "$(uname)" = "Darwin" ] || [ "$(uname)" = "WSL" ]; then
    default_dir="$HOME"
elif uname | grep -E -i 'cygwin|mingw|msys' > /dev/null; then
    if [ -z "$USERPROFILE" ]; then
        echo "USERPROFILE environment variable is not set. Please set it and try again."
        exit 1
    fi
    default_dir="$USERPROFILE/Documents"
else
    echo "Unsupported OS. Are you from the future or something?"
    exit 1
fi

# Prompt for the directory to create the repository
printf "Enter the directory to create the repository (default: $default_dir): "
read repo_dir

# Use default directory if no input is provided
repo_dir="${repo_dir:-$default_dir}"

# Create the repository using the API
case "$platform" in
    1)
        response=$(curl -s -w "%{http_code}" -o /dev/null -u "$git_username:$git_token" -d "{\"name\":\"$repo_name\"}" "$api_url/user/repos")
        ;;
    2)
        response=$(curl -s -w "%{http_code}" -o /dev/null -H "Private-Token: $git_token" -d "name=$repo_name" "$api_url/projects")
        ;;
    3)
        response=$(curl -s -w "%{http_code}" -o /dev/null -u "$git_username:$git_token" -d "{\"scm\":\"git\",\"is_private\":\"true\",\"name\":\"$repo_name\"}" "$api_url/repositories/$git_username/$repo_name")
        ;;
esac

# Check if the repository creation was successful
if [ "$response" -eq 201 ] || [ "$response" -eq 200 ]; then
    echo "Repository '$repo_name' created successfully."
else
    echo "Failed to create repository. HTTP response code: $response"
    exit 1
fi

# Initialize local repository - because doing it manually is so last century
mkdir -p "$repo_dir/$repo_name"
cd "$repo_dir/$repo_name" || exit
git init

# Set the remote URL with embedded credentials
git remote add origin "https://$git_username:$git_token@$remote_base_url/$git_username/$repo_name.git"

# Optional README.md
printf "Do you want to add a README.md file? (y/n): "
read add_readme
add_readme=$(echo "$add_readme" | tr '[:upper:]' '[:lower:]')
if [ "$add_readme" = "y" ]; then
    echo "# $repo_name" > README.md
    git add README.md
fi

# Initial commit and push - because who has time for that?
git commit -m "Initial commit"
git push -u origin "$branch_name"

echo "Repository initialized and pushed to https://$remote_base_url/$git_username/$repo_name successfully."
