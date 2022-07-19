#!/bin/zsh

if [ -f ~/.zshrc ]
then
    rm ~/.zshrc
    echo "... Removed old .zshrc file from ~."
fi

if [ ! -f ~/.zshrc ]
then
    cp ./.zshrc ~/
    echo "... Added your custom .zshrc file to ~."
fi

echo "... Your development environment is set up!"
