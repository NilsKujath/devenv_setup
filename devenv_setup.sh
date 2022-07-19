#!/bin/zsh

# REPLACE LOCAL .zshrc FILE WITH CUSTOM .zshrc FILE
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


# REPLACE LOCAL .gitconfig FILE WITH CUSTOM .gitconfig FILE
if [ -f ~/.gitconfig ]
then
    rm ~/.gitconfig
    echo "... Removed old .gitconfig file from ~."
fi

if [ ! -f ~/.gitconfig ]
then
    cp ./.gitconfig ~/
    echo "... Added your custom .gitconfig file to ~."
fi


# CHECK IF homebrew IS INSTALLED, IF NOT, INSTALL IT
if ! command -v brew &> /dev/null
then
    rm -r /usr/local/*
    echo "Homebrew is not installed. Initiating installation:"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "... Installed Hombrew"
else
    brew update
    brew doctor
    brew upgrade
    brew install neovim
    brew install node #dependency of coc.vim plugin
fi





# INDICATE THAT SETUP IS COMPLETE
echo "... Your development environment is set up!"
