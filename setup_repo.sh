read -p "Enter the directory name: " dirname

# Create the directory
mkdir -p "$dirname"

# Change to the new directory
cd "$dirname"

read -p "Sprint number: " sprint

read -p "Brief number: " brief

read -p "Brief name: " name

repo_name="S"$sprint"_Brief-"$brief""

org_repo_name="Abderrahman_Badi_Sprint_"$sprint"_B"$brief"_"$name""

username=$(gh api user -q ".login")

org=JavaAura

git init

git branch -M main

# Check if GitHub CLI is authenticated
gh auth status > /dev/null 2>&1

if [ $? -ne 0 ]; then
    # Not authenticated
    echo "Please configure your gh CLI with \"gh auth login\""
    exit 1
fi


# Check if the repository already exists on GitHub for Yorften
gh repo view $username/$repo_name > /dev/null 2>&1
if [ $? -ne 0 ]; then
    # If it doesn't exist, create it
    gh repo create $username/$repo_name --public --gitignore=Java
else
    # If it exists, exit program
    echo "GitHub repository '$username/$repo_name' already exists. Please provide another name."
    exit 1
fi


# Check if the repository already exists on GitHub for JavaAura/Yorften
gh repo view $org/$org_repo_name > /dev/null 2>&1
if [ $? -ne 0 ]; then
    # If it doesn't exist, create it
    gh repo create $org/$org_repo_name --public
else
    # If it exists, exit program
    echo "GitHub repository '$org/$org_repo_name' already exists. Please provide another name."
    exit 1
fi

git remote add origin git@github.com:$username/$repo_name

git remote set-url --add --push origin git@github.com:$username/$repo_name

git remote set-url --add --push origin git@github.com:$org/$org_repo_name

git pull origin main

git push -u origin main

echo "Repository setup complete. Pushed to both remotes."


