set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ++++++++++++++++++++++++++++
" http://tinyurl.com/mwm8dsp

" Plugins on GitHub
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'tomtom/tcomment_vim'
Plugin 'flazz/vim-colorschemes'

" ++++++++++++++++++++++++++++

filetype plugin indent on

syntax on

" Vim layout
set cursorline
set colorcolumn=80
set title
set ruler
set number
set mouse=a

" Indent
set cindent
set smartindent

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Colour Scheme
" syntax enable
set t_Co=256
set background=dark
color gruvbox

" Swap file directory - stop swp polluting the working directory
set backupdir=$HOME/.vim/tmp
set directory=$HOME/.vim/tmp

" Toggle Nerd Tree with Ctrl+L
map <C-L> :NERDTreeToggle<CR>
" Show hidden files
let NERDTreeShowHidden=1

" Show the highlight group names for syntax highlighting
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

au BufRead,BufNewFile *.resx set filetype=xml
au BufRead,BufNewFile *.ui set filetype=ruby
au BufRead,BufNewFile *.pjax.erb set filetype=html
au BufRead,BufNewFile *.mustache set filetype=javascript
au BufNewFile,BufRead *.ctp set filetype=html
au BufNewFile,BufRead *.ru set filetype=ruby
au BufNewFile,BufRead Gemfile set filetype=ruby
au BufNewFile,BufRead Guardfile set filetype=ruby
au BufNewFile,BufRead Rakefile set filetype=ruby
au BufNewFile,BufRead Fudgefile set filetype=ruby