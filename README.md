# devenv_setup

## About

Automates setup of custom development environment on a new machine.
The automated setup is done by running a zsh shell script.
This shell script is geared towards macOS and tested on macOS Monterey 12.4.

A side effect of this solution is that config files can be maintained inside this repository and are updated in the local environment by running the script.

## Installation
Run `git clone https://github.com/NilsKujath/devenv_setup.git` then `cd` into `devenv_setup` and execute `devenv_setup.sh` (e.g. `zsh devenv_setup.sh`).

If you dont have a preinstalled version of Git on your machine (check by running `git --version`),
You might need to first install the xcode commandline tools (run `xcode-select --install`, afterwards run `git --version` to recheck).

## Missing Features
List of missing features:
*   instalation of conda & anaconda and setup of environment
*   setting of firefox as default browser and import of bookmarks into firefox
*   calendar settings, as in `defaults write com.apple.iCal n\ days\ of\ week 14`
*   system settings
*   Finder settings

## License

BSD 3-Clause License

Copyright (c) 2018, the respective contributors, as shown by the AUTHORS file.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

* Neither the name of the copyright holder nor the names of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
