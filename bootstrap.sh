# These dotfiles are for Gitpod Flex
git config --global --add --bool push.autoSetupRemote true
git config --global alias.b "branch"
git config --global alias.c "commit"
git config --global alias.st "status"
git config --global alias.s "switch"
git config --global alias.co "checkout"
git config --global alias.tidy "!git branch | grep -E -v 'main' | xargs git branch -d"
git config --global alias.ds "diff --stat origin/main...HEAD"

if command -v sudo >/dev/null 2>&1; then
    sudo chsh "$(id -un)" --shell "/usr/bin/zsh"
else
    echo "No sudo access available - skipping shell change"
fi

# Include the environment name in the zsh prompt
if command -v jq; then
    echo 'export ENVIRONMENT_NAME=$(gitpod environment get $GITPOD_ENVIRONMENT_ID -o json | jq -r ".[0].metadata.name // .[0].id")' >> $HOME/.zshrc
else
    echo 'export ENVIRONMENT_NAME="$GITPOD_ENVIRONMENT_ID"' >> $HOME/.zshrc
fi
echo 'export PS1="%B%F{yellow}[${ENVIRONMENT_NAME}]%f %F{green}%n@%m%f:%F{blue}%~%f%b$ "' >> $HOME/.zshrc

FZF_VERSION="0.60.3"
if ! command -v fzf >/dev/null 2>&1; then
    echo "Installing fzf..."
    curl -L https://github.com/junegunn/fzf/releases/download/v${FZF_VERSION}/fzf-${FZF_VERSION}-linux_amd64.tar.gz | tar xzvf -
    sudo mv fzf /usr/local/bin
    echo "fzf installation completed"
else
    echo "fzf is already installed"
fi
echo "Configuring fzf..."
echo "source <(fzf --zsh)" >> $HOME/.zshrc

if ! command -v tig >/dev/null 2>&1; then
    apt-get update && apt-get install -y tig
else
    echo "tig is already installed"
fi

# Handle .profile setup
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
if [ ! -e "$HOME/.profile" ]; then
    # If ~/.profile doesn't exist, symlink it
    ln -s "$DOTFILES_DIR/.profile" "$HOME/.profile"
    echo "Created symlink: ~/.profile -> $DOTFILES_DIR/.profile"
else
    # If ~/.profile exists, append source line if not already present
    if ! grep -q "source.*.profile" "$HOME/.profile" 2>/dev/null; then
        echo '' >> "$HOME/.profile"
        echo "source \"$DOTFILES_DIR/.profile\"" >> "$HOME/.profile"
        echo "Added source line to existing ~/.profile"
    fi
fi