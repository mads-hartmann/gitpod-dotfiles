# Detect which editor is available and set accordingly
if command -v cursor > /dev/null 2>&1; then
    export EDITOR="cursor --wait"
elif command -v code > /dev/null 2>&1; then
    export EDITOR="code --wait"
fi
git config --global core.editor "$EDITOR"
