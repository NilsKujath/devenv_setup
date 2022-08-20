#!/bin/zsh
echo ""

echo "=============================================================="
echo "Adding your custum config files and overwriting existing ones:"
echo "==============================================================" && echo ""
cp ./dotfiles/.zshrc ~/ && echo "...added config file for zsh shell."
cp ./dotfiles/.gitconfig ~/ && echo "...added config file for global Git settings."
cp ./dotfiles/.vimrc ~/ && echo "...added config file for vim."
cp ./dotfiles/init.vim ~/.config/nvim/ && echo "...added config file for neovim."
cp ./dotfiles/.gitignore_global ~/ && echo "...added global gitignore settings." 
echo "All your custom config files have been added!" && echo ""

echo "=============================================================="
echo "Checking Homebrew (package manager) and managing packages:"
echo "==============================================================" && echo ""
if ! command -v brew &> /dev/null; then
    rm -r /usr/local/*
    echo "...Homebrew (package manager) is not installed. Initiating installation:"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Successfully installed Homebrew (package manager)." & echo ""
else
    echo "...updating Homebrew (package manager)." && brew update
    echo "...checking for missing packages." && brew upgrade
    if [ ! -d /usr/local/Cellar/neovim ]; then brew install neovim; fi
    if [ ! -d /usr/local/Cellar/node ]; then brew install node; fi  #dependency of coc.vim plugin
    if [ ! -d /usr/local/Cellar/git ]; then brew install git; fi
    if [ ! -d /usr/local/Cellar/gh ]; then brew install gh; fi      #GitHub command-line tool
    if [ ! -d /usr/local/Cellar/wget ]; then brew install wget; fi
    if [ ! -d /usr/local/Cellar/tree ]; then brew install tree; fi
    if [ ! -d /usr/local/Cellar/gcc ]; then brew install gcc; fi
    if [ ! -d /usr/local/Caskroom/firefox ]; then brew install --cask firefox; fi
    if [ ! -d /usr/local/Caskroom/mactex ]; then brew install --cask mactex; fi
    if [ ! -d /usr/local/Caskroom/texstudio ]; then brew install --cask texstudio; fi
    if [ ! -d /usr/local/Cellar/mysql ]; then
        brew install mysql
        mysql.server start  # required to set password for mysql server
        mysql_secure_installation
        mysql.server stop; fi
    brew cleanup && echo "...removing unused and uninstalled files."
    echo "All necessary packages are installed!" && echo ""
fi

echo "=============================================================="
echo "Setting up vim-plug (plugin manager for vim and neovim):"
echo "==============================================================" && echo ""
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    echo "...installing vim-plug for neovim:"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'; fi
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "...installing vim-plug for vim:"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; fi
echo "vim-plug is installed for vim and neovim!" && echo ""

echo "" && echo ""
echo "WARNING: The following steps need to be executed manually:"
echo "    * open vim/nvim and run ':PlugInstall' and ':PlugUpgrade'"
echo "    * manually install mactex.pkg from Caskroom"
echo "    * download anaconda"
echo "    * set up texstudio"
echo "    * install firefox, set as default, import bookmarks"
echo "    * run 'source ~/.zshrc'"
echo "    * install latex dotfiles"
echo "    * install updates and upgrade MacOS" && echo "" && echo "" && echo "" 
