# These dotfiles are for Gitpod Flex
git config --global --add --bool push.autoSetupRemote true
git config --global alias.b "branch"
git config --global alias.c "commit"
git config --global alias.st "status"
git config --global alias.s "switch"
git config --global alias.co "checkout"
git config --global alias.tidy "!git branch | grep -E -v 'main' | xargs git branch -d"
git config --global core.editor "cursor --wait"

echo 'export EDITOR="cursor --wait"' >> $HOME/.profile