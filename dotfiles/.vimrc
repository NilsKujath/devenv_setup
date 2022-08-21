" BSD 3-Clause License

" Copyright (c) 2022, Nils P. Kujath
" All rights reserved.

" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions are met:

" 1. Redistributions of source code must retain the above copyright notice, this
"    list of conditions and the following disclaimer.

" 2. Redistributions in binary form must reproduce the above copyright notice,
"    this list of conditions and the following disclaimer in the documentation
"    and/or other materials provided with the distribution.

" 3. Neither the name of the copyright holder nor the names of its
"    contributors may be used to endorse or promote products derived from
"    this software without specific prior written permission.

" THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
" DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
" FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
" DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
" SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
" CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
" OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
" OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

set nocompatible    " disables compatibility with vi, which might cause some unexpected issues

" ===== vim-plug PLUGIN MANAGER =====
call plug#begin('~/.vim/plugged')
    Plug 'joshdick/onedark.vim'     "color scheme for terminal
    Plug 'preservim/NERDTree'       "file system explorer for vim editor
    Plug 'tpope/vim-commentary'     "easy commenting and de-commenting of a line by bressing <g-c-c>
    Plug 'sheerun/vim-polyglot'     "a collection of languages to support syntax highlighting and indentation
    Plug 'Vimjas/vim-python-pep8-indent'
                                    "python indentation
call plug#end()

"   ===== TAB AND INDENTATION SETTINGS =====
set tabstop=4       "specifies the width of a tab character
set expandtab       "causes spaces to be used insted of tab characters when <TAB> is pressed
set softtabstop=4   "regulates the amount of whitespace to be inserted when pressing  <TAB> or removed when pressing <BACKSPACE>
set shiftwidth=4    "determines the amount of whitespace to be inserted or removed when using indentation commands in normal mode
set autoindent      "automatically inserts the indentation of previous line after <ENTER> is pressed
set smartindent     "dependant on shiftwidth value

"   ===== EDITOR LAYOUT =====
set list            "displays unprintable characters
set signcolumn=no   "displays messages in column if set to yes
set nowrap          "disallows line wrapping
set noerrorbells    "disable bells
set number          "activates line numbers
set relativenumber  "shows line number for current line and relative line numbers for all other lines
set scrolloff=20    "keeps context visible when scrolling
set cursorcolumn    "highlights the cursor column
set cursorline      "highlights the cursor line
filetype on         "enables file type detection
syntax on           "enables syntax highlighting
colorscheme onedark "PLUG-IN DEPENDENT 'joshdick/onedark.vim'; sets colorscheme for syntax highlighting

" ===== SEARCH SETTINGS =====
set ignorecase      "disables case sensitivity for search
set smartcase       "DEPENDENT 'ignorecase'; search only case sensitive if pattern contains upper case letter
set incsearch       "allows for incremental search while typing

" ===== COMMAND LINE INTERACTION =====
set wildmenu        "enables command line completion as specified by wildmode
set wildmode=list:longest
set splitbelow      "if horizontal split, open new window below exiting window
set splitright      "if vertical split, open new window to the right of existing window

" ===== REMAPS =====
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
                    " faster moving between split windows

" ===== HISTORY =====
set hidden          "allow unwritten buffers to exist in the background
set noswapfile      "no swapfiles
set nobackup        "no backups
set nowritebackup   "no backups

" ===== PLUGIN SPECIFIC SETTINGS 'nerdtree' =====
autocmd VimEnter * NERDTree | wincmd p
                    "when opening file, start 'nerdtree' and put the cursor back to the file that was opened
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
                    "exit vim if 'nerdtree' is the only window remaining

" ===== MISC =====
command! -nargs=* T split | resize 20 | terminal <args>
                    "open terminal in split window
