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
    echo "Git is not installed. Seriously? Please install Git and try again."
    exit 1
fi

# Prompt for action
printf "What do you want to do? (1 for create, 2 for fork, 3 for delete): "
read action

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
        api_base_url="https://api.github.com"
        branch_name="main"
        ;;
    2)
        remote_base_url="gitlab.com"
        api_base_url="https://gitlab.com/api/v4"
        branch_name="master"
        ;;
    3)
        remote_base_url="bitbucket.org"
        api_base_url="https://api.bitbucket.org/2.0"
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

handle_error() {
    case "$1" in
        400) echo "Bad Request - Did you mess something up?" ;;
        401) echo "Unauthorized - Who do you think you are?" ;;
        403) echo "Forbidden - You shall not pass!" ;;
        404) echo "Not Found - Are you lost?" ;;
        422) echo "Unprocessable Entity - What did you do?" ;;
        500) echo "Internal Server Error - It's not you, it's me." ;;
        502) echo "Bad Gateway - The server is drunk." ;;
        503) echo "Service Unavailable - The server is on a coffee break." ;;
        504) echo "Gateway Timeout - The server is taking too long. Patience, young padawan." ;;
        *) echo "An unexpected error occurred. HTTP status code: $1" ;;
    esac
    exit 1
}

if [ "$action" -eq 3 ]; then
    # Delete repository
    printf "Are you sure you want to delete the repository '$repo_name'? This action cannot be undone. Type the repository name to confirm: "
    read confirm_repo_name
    if [ "$confirm_repo_name" = "$repo_name" ]; then
        case "$platform" in
            1)
                response=$(curl -s -w "%{http_code}" -o /dev/null -u "$git_username:$git_token" -X DELETE "$api_base_url/repos/$git_username/$repo_name")
                ;;
            2)
                response=$(curl -s -w "%{http_code}" -o /dev/null -H "Private-Token: $git_token" -X DELETE "$api_base_url/projects/$git_username%2F$repo_name")
                ;;
            3)
                response=$(curl -s -w "%{http_code}" -o /dev/null -u "$git_username:$git_token" -X DELETE "$api_base_url/repositories/$git_username/$repo_name")
                ;;
        esac
        if [ "$response" -eq 204 ]; then
            echo "Repository '$repo_name' deleted successfully. It's gone. Poof!"
        else
            handle_error "$response"
        fi
    else
        echo "Repository deletion canceled. You live to code another day."
        exit 1
    fi
    exit 0
fi

if [ "$action" -eq 2 ]; then
    # Fork mode enabled
    printf "Enter the source repository (in the format owner/repo): "
    read source_repo

    case "$platform" in
        1)
            # Fork GitHub repository
            response=$(curl -s -w "%{http_code}" -o /dev/null -u "$git_username:$git_token" -X POST "$api_base_url/repos/$source_repo/forks")
            ;;
        2)
            # Fork GitLab repository
            response=$(curl -s -w "%{http_code}" -o /dev/null -H "Private-Token: $git_token" -X POST "$api_base_url/projects/$(echo "$source_repo" | sed 's/\//%2F/g')/fork")
            ;;
        3)
            # Fork Bitbucket repository
            response=$(curl -s -w "%{http_code}" -o /dev/null -u "$git_username:$git_token" -X POST "$api_base_url/repositories/$source_repo/forks" -d "{\"name\":\"$repo_name\"}")
            ;;
    esac

    if [ "$response" -eq 202 ] || [ "$response" -eq 201 ]; then
        echo "Repository '$source_repo' forked successfully. Enjoy your new clone."
    else
        handle_error "$response"
    fi

    # Clone the forked repository
    git clone "https://$git_username:$git_token@$remote_base_url/$git_username/$repo_name.git"
    cd "$repo_name" || { echo "Cloning failed. Maybe check your internet connection?"; exit 1; }

else
    # Normal mode: Create a new repository
    # Check if the repository already exists
    case "$platform" in
        1)
            response=$(curl -s -w "%{http_code}" -o /dev/null -u "$git_username:$git_token" "$api_base_url/repos/$git_username/$repo_name")
            ;;
        2)
            response=$(curl -s -w "%{http_code}" -o /dev/null -H "Private-Token: $git_token" "$api_base_url/projects/$git_username%2F$repo_name")
            ;;
        3)
            response=$(curl -s -w "%{http_code}" -o /dev/null -u "$git_username:$git_token" "$api_base_url/repositories/$git_username/$repo_name")
            ;;
    esac

    if [ "$response" -eq 200 ]; then
        echo "Repository '$repo_name' already exists. Try being original."
        exit 1
    elif [ "$response" -ne 404 ]; then
        handle_error "$response"
    fi

    # Determine default directory
    if [ "$(uname)" = "Linux" ] || [ "$(uname)" = "Darwin" ] || [ "$(uname)" = "WSL2" ]; then
        default_dir="$HOME"
    elif [ "$(uname | grep -E -i 'cygwin|mingw|msys')" ]; then
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
            response=$(curl -s -w "%{http_code}" -o /dev/null -u "$git_username:$git_token" -d "{\"name\":\"$repo_name\"}" "$api_base_url/user/repos")
            ;;
        2)
            response=$(curl -s -w "%{http_code}" -o /dev/null -H "Private-Token: $git_token" -d "name=$repo_name" "$api_base_url/projects")
            ;;
        3)
            response=$(curl -s -w "%{http_code}" -o /dev/null -u "$git_username:$git_token" -d "{\"scm\":\"git\",\"is_private\":\"true\",\"name\":\"$repo_name\"}" "$api_base_url/repositories/$git_username/$repo_name")
            ;;
    esac

    # Check if the repository creation was successful
    if [ "$response" -eq 201 ] || [ "$response" -eq 200 ]; then
        echo "Repository '$repo_name' created successfully. You're welcome."
    else
        handle_error "$response"
    fi

    # Initialize local repository - because doing it manually is so last century
    mkdir -p "$repo_dir/$repo_name"
    cd "$repo_dir/$repo_name" || { echo "Failed to create directory. Did you forget to give permissions?"; exit 1; }
    git init

    # Set the remote URL with embedded credentials
    git remote add origin "https://$git_username:$git_token@$remote_base_url/$git_username/$repo_name.git"
fi

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

echo "Repository initialized and pushed to https://$remote_base_url/$git_username/$repo_name successfully. Now go build something amazing."
