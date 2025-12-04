# Detect which editor is available and set accordingly
export EDITOR="nano"
if command -v cursor > /dev/null 2>&1; then
    export EDITOR="cursor --wait"
elif command -v code > /dev/null 2>&1; then
    export EDITOR="code --wait"
fi
git config --global core.editor "$EDITOR"

# Include the environment name in the zsh prompt
if command -v jq; then
    export ENVIRONMENT_NAME=$(gitpod environment get -o json | jq -r ".[0].metadata.name // .[0].id")
else
    export ENVIRONMENT_NAME="$GITPOD_ENVIRONMENT_ID"
fi
PS1="%B%F{yellow}[${ENVIRONMENT_NAME}]%f %F{green}%n@%m%f:%F{blue}%~%f%b$ "

echo "Configuring fzf..."
echo "source <(fzf --zsh)" >> $HOME/.zshrc
