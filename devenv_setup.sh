#!/bin/zsh
echo ""

# ===== CONFIG FILES =====
echo "Adding your custum config files and overwriting existing ones (if necessary):"
echo ""
cp ./.zshrc ~/ && echo "Added config file for zsh shell."
cp ./.gitconfig ~/ && echo "Added config file for global Git settings."
cp ./.vimrc ~/ && echo "Added config file for vim."
cp ./init.vim ~/.config/nvim/ && echo "Added config file for neovim."
echo ""
echo "All your custom config files have been added!" && echo ""

# ===== PACKAGE MANAGERS =====
echo "Checking for Homebrew:"
if ! command -v brew &> /dev/null
then
    rm -r /usr/local/*
    echo "Homebrew is not installed. Initiating installation:"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Successfully Installed Hombrew" & echo ""
else
    echo "Updating Homebrew:"
    brew update
    brew upgrade
    if [ ! -d /usr/local/Cellar/neovim ]; then brew install neovim; fi
    if [ ! -d /usr/local/Cellar/node ]; then brew install node; fi #dependency of coc.vim plugin
    echo ""
fi

echo "Checking for vim-plug:"
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    echo "Installing vim-plug for neovim:"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "Installing vim-plug for vim:"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
echo "vim-plug is installed for vim and neovim!" && echo ""

# ===== END =====
echo "Your development environment is set up!"
