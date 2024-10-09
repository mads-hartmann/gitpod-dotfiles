# These dotfiles are for Gitpod Flex
git config --global --add --bool push.autoSetupRemote true
git config --global alias.st "status"
git config --global alias.co "checkout"
git config --global alias.tidy "!git branch --merged | grep -E -v '(master|staging)' | grep -E -v '^\\*' | xargs git branch -d"
git config --global core.editor "code --wait"

echo 'export EDITOR="code --wait"' >> $HOME/.profile