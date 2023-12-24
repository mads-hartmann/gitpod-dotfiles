# My Gitpod specific dotfiles.
#
# See the official docs
#   https://www.gitpod.io/docs/configure/user-settings/dotfiles
#
# For debugging
#   cat /home/gitpod/.dotfiles.log
#

git config --global --add --bool push.autoSetupRemote true

echo 'export EDITOR="code --wait"' >> $HOME/.bashrc.d/100-environment-variables