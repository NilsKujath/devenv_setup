# devenv_setup

## About

Automates setup of custom development environment on a new machine.
The automated setup is done by running a zsh shell script.
This shell script is geared towards macOS and tested on macOS Monterey 12.4.

A side effect of this solution is that config files can be maintained inside this repository and are updated in the local environment by running the script.

## Installation
Run `git clone https://github.com/NilsKujath/devenv_setup.git` then `cd` into `devenv_setup` and execute `devenv_setup.sh` (e.g. `zsh devenv_setup.sh`).

If you dont have a preinstalled version of Git on your machine (check by running `git --version`),
you might need to first install the xcode commandline tools (run `xcode-select --install`, afterwards run `git --version` to recheck).
