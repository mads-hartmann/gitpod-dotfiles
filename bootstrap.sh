# These dotfiles are for Gitpod Flex
git config --global --add --bool push.autoSetupRemote true
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