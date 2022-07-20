# devenv_setup

Automates setup of custom development environment on a new machine.
The automated setup is done by running a zsh shell script.
This shell script is geared towards macOS and tested on macOS Monterey 12.4.

## Installation
Run `git clone https://github.com/NilsKujath/devenv_setup.git` then `cd` into `devenv_setup` and execute `devenv_setup.sh` (e.g. `zsh devenv_setup.sh`).

If you dont have a preinstalled version of Git on your machine (check by running `git --version`),
you might need to first install the xcode commandline tools (run `xcode-select --install`, afterwards run `git --version` to recheck).

## ToDo

* automatically downloads vim-plug
* automatically run :PlugInstall and :PlugUpgrade on reloaded .vimrc and .init.nvim (that might need to execute a separate file)
* brew git and reload shell (so the version switches from Apple-Git to the homebrew git, if still necessary)
* downlad all necessary compilers for C++ (brew)
* automatically compare versions of programs installed by brew with version list that should be installed (to make sure there are no empty dirs); automatically install what is missing
* brew install gh for github command line tools after git has been installed
* make sure all brew programs are up to date
