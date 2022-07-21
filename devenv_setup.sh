#!/bin/zsh
echo ""

# ===== CONFIG FILES =====
echo "Adding your custum config files and overwriting existing ones:" && echo ""
cp ./dotfiles/.zshrc ~/ && echo "...added config file for zsh shell."
cp ./dotfiles/.gitconfig ~/ && echo "...added config file for global Git settings."
cp ./dotfiles/.vimrc ~/ && echo "...added config file for vim."
cp ./dotfiles/init.vim ~/.config/nvim/ && echo "...added config file for neovim."
echo "" && echo "All your custom config files have been added!" && echo ""

# ===== PACKAGE MANAGERS =====
echo "Checking for Homebrew:"
if ! command -v brew &> /dev/null
then
    rm -r /usr/local/*
    echo "...Homebrew is not installed. Initiating installation:"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Successfully Installed Hombrew" & echo ""
else
    echo "...updating Homebrew:"
    brew update
    brew upgrade
    if [ ! -d /usr/local/Cellar/neovim ]; then brew install neovim; fi
    if [ ! -d /usr/local/Cellar/node ]; then brew install node; fi  #dependency of coc.vim plugin
    if [ ! -d /usr/local/Cellar/git ]; then brew install git; fi
    if [ ! -d /usr/local/Cellar/gh ]; then brew install gh; fi      #GitHub command-line tool
    if [ ! -d /usr/local/Cellar/wget ]; then brew install wget; fi
    if [ ! -d /usr/local/Cellar/tree ]; then brew install tree; fi
    echo ""
fi

echo "Checking for vim-plug:"
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    echo "...installing vim-plug for neovim:"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "...installing vim-plug for vim:"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
echo "vim-plug is installed for vim and neovim!" && echo ""

# ===== END =====
echo "Your development environment is set up!" && echo ""
echo "What you need to do next:"
echo "=> open vim or nvim and run ':PlugInstall' and ':PlugUpgrade'"
echo "=> download anaconda" && echo ""
