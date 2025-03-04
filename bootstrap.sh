# These dotfiles are for Gitpod Flex
git config --global --replace-all --bool push.autoSetupRemote true
git config --global alias.b "branch"
git config --global alias.c "commit"
git config --global alias.st "status"
git config --global alias.s "switch"
git config --global alias.co "checkout"
git config --global alias.tidy "!git branch | grep -E -v 'main' | xargs git branch -d"
git config --global core.editor "cursor --wait"
git config --global push.autoSetupRemote true

echo 'export EDITOR="cursor --wait"' >> $HOME/.profile

if command -v sudo >/dev/null 2>&1; then
    sudo chsh "$(id -un)" --shell "/usr/bin/zsh"
else
    echo "No sudo access available - skipping shell change"
fi

echo 'export PS1="%B%F{green}%n@%m%f:%F{blue}%~%f%b$ "' >> $HOME/.zshrc

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
