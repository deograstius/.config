set nocompatible              " be iMproved, required
filetype off                  " required

" set the run time path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" This is a theme that makes vim look the way it does.
Plugin 'nanotech/jellybeans.vim'

" NOTE: The next 3 plugins make sure google/vim-codefmt works well.
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

" JSX support.
Plugin 'maxmellon/vim-jsx-pretty'

" Enable linting.
Plugin 'dense-analysis/ale'

" Ack for vim.
Plugin 'mileszs/ack.vim'

" Turn on autocomplete.
Plugin 'ycm-core/YouCompleteMe'

" Add spell checking in code.
Plugin 'shinglyu/vim-codespell'

" Allow auto comments.
Plugin 'tpope/vim-commentary'

" Add terraform formatting.
Plugin 'hashivim/vim-terraform'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme jellybeans

set number                     " Show numbers.
set expandtab                  " Replace tabs with spaces.
set autoindent                 " Automatically indent code.
set tabstop=2                  " Set 2 spaces per tab.
set softtabstop=2              " Make sure we can back space to spaces at a time.
set showcmd                    " Show the current command in the bottom tab.
set wildmenu                   " Allow a menu to appear when there are more options.
set lazyredraw                 " Make sure vim doesn't draw things unnecessarily.
set incsearch                  " search as characters are entered
set hlsearch                   " highlight search matches.
set foldenable                 " enable folding of code.
set mouse=a                    " enable mouse.
set backspace=indent,eol,start " Allow back spacing in insert mode.

" Enable spell checking.
setlocal spell spelllang=en_us 

" Don't offer to open certain files/directories for the wildmenu.
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

" Disable preview window for you complete me.
set completeopt-=preview

" Make sure that if you vc into a directory, vim changes directories.
set autochdir

syntax on  " Turn on syntax highlighting.

" Enable backup for temp files.
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Configure google/vim-codefmt.
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json,javascript AutoFormatBuffer prettier
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

" Configure spellcheck.
autocmd BufWritePre *.py,*.js,*.jsx,*.tf,*.css,*.json,*.html,* :Codespell
autocmd FileType python,javascript,terraform,css,json,html :Codespell

" Configure ale lint.
" Set the linters to use.
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

" Set the icons to show for warnings and failures.
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '☠️'
let g:ale_sign_warning = '⚠️'
let g:ale_lint_on_text_changed = 'never'

" Fix the code on save.
let g:ale_fix_on_save = 1

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>

" Configure terraform.
let g:terraform_fmt_on_save=1 " Format on save.
let g:terraform_align=1       " Make sure to use 2 spaces.
