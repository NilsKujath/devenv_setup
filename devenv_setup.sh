# BSD 3-Clause License

# Copyright (c) 2022, Nils P. Kujath
# All rights reserved.

# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:

# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.

# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.

# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.

# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#!/bin/zsh
echo ""

echo "==================================="
echo "Installing Xcode Comand Line Tools:"
echo "===================================" && echo ""
xcode-select --install

echo "=============================================================="
echo "Adding your custum config files and overwriting existing ones:"
echo "==============================================================" && echo ""
if [ ! -d ~/.config ]; then mkdir ~/.config; fi
if [ ! -d ~/.config/nvim ]; then mkdir ~/.config/nvim; fi
if [ ! -d ~/.config/texstudio ]; then mkdir ~/.config/texstudio; fi
cp ./dotfiles/.zshrc ~/ && echo "...added config file for zsh shell"
cp ./dotfiles/.gitconfig ~/ && echo "...added config file for global Git settings"
cp ./dotfiles/.vimrc ~/ && echo "...added config file for vim"
cp ./dotfiles/init.vim ~/.config/nvim/ && echo "...added config file for neovim"
cp ./dotfiles/.gitignore_global ~/ && echo "...added global gitignore settings" 
cp ./dotfiles/texstudio.ini ~/.config/texstudio/ && echo "...added config file for texstudio"
echo "All your custom config files have been added!" && echo ""

echo "=============================================================="
echo "Checking Homebrew (package manager):"
echo "==============================================================" && echo ""
if ! command -v brew &> /dev/null; then
    rm -r /usr/local/*
    echo "...Homebrew (package manager) is not installed; initiating installation:"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Successfully installed Homebrew (package manager)." & echo ""; fi

echo "==================================================="
echo "Installing missing software and their dependencies:"
echo "===================================================" && echo ""
echo "...updating Homebrew (package manager)" && brew update
echo "...checking for missing packages" && brew upgrade
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
if [ ! -d /usr/local/Caskroom/flux ]; then brew install --cask flux && open /Applications/Flux.app; fi
if [ ! -d /usr/local/Cellar/mysql ]; then
    brew install mysql
    mysql.server start  # required to set password for mysql server
    mysql_secure_installation
    mysql.server stop; fi
brew cleanup && echo "...removing unused and uninstalled files"
echo "All necessary packages are installed!" && echo ""

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
echo "    * set firefox as default, import bookmarks"
echo "    * run 'source ~/.zshrc'"
echo "    * intall uBlockOrigin AddOn for Firefox"
echo "    * run gh auth login"
echo "    * install updates and upgrade MacOS" && echo "" && echo "" && echo "" 
