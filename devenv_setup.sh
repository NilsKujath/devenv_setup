#!/bin/zsh

# REPLACE LOCAL .zshrc FILE WITH CUSTOM .zshrc FILE
if [ -f ~/.zshrc ]; then rm ~/.zshrc && echo "Removed old .zshrc file from ~."; fi
if [ ! -f ~/.zshrc ]; then cp ./.zshrc ~/ && echo "Added your custom .zshrc file to ~."; fi

# REPLACE LOCAL .gitconfig FILE WITH CUSTOM .gitconfig FILE
if [ -f ~/.gitconfig ]; then rm ~/.gitconfig && echo "Removed old .gitconfig file from ~."; fi
if [ ! -f ~/.gitconfig ]; then cp ./.gitconfig ~/ && echo "Added your custom .gitconfig file to ~."; fi

# CHECK IF homebrew IS INSTALLED, IF NOT, INSTALL IT
if ! command -v brew &> /dev/null
then
    rm -r /usr/local/*
    echo "Homebrew is not installed. Initiating installation:"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Successfully Installed Hombrew"
else
    echo "Updating Homebrew"
    brew update
    brew upgrade
    if [ ! -d /usr/local/Cellar/neovim ]; then brew install neovim; fi
    if [ ! -d /usr/local/Cellar/node ]; then brew install node; fi #dependency of coc.vim plugin
fi

# LOAD vim-plug PLUGIN MANAGER FOR NEOVIM
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    echo "Installing vim-plug for neovim:"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# LOAD vim-plug PLUGIN MANAGER FOR VIM
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "Installing vim-plug for vim:"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


# INDICATE THAT SETUP IS COMPLETE
echo "Your development environment is set up!"
