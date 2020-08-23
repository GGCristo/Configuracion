# dotfiles <img src="https://media.giphy.com/media/du3J3cXyzhj75IOgvA/giphy.gif" width="60" height="60" />
## Archivos personales de configuracion
### Herramientas generales:
-FZF\
-Catch2\
-Cppcheck\
-clang-tidy\
-thefuck\
-hub\
-colorls\
-bat\
-Albert\
-Travis CI\
-zsh(oh-my-zsh)
 - zsh-you-should-use
 - zsh-autosuggestion
### Vim Plugins:
-Vim-plug\
-ALE\
-coc.nvim
 - coc-pairs
 - coc-snippets
 
-Tagbar\
-fzf.vim\
-obsession.vim\
-fugitive.vim\
-vim-airline\
-vim-startify\
-vim-gitgutter\
-vimspector\
-vim-snippets\
-vim-surround\
-vim-dispatch\
-Nerdtree\
-Vim-devicons\
-Tabular\
-Switch.vim\
-List-Toggle\
-vim-easymotion

-Theme: Gruvbox

Para instalar Vim (versión IDE).\
`stty -ixon` en el script de arranque (p. ej: .bashrc)\
Dependencias:\
o Vim version 8.2 con python 3\
o Universal-Ctags
```
# install libjansson first
$ sudo apt-get install libjansson-dev

# then compile and install universal-ctags.
#
# NOTE: Don't use `sudo apt install ctags`, which will install exuberant-ctags and it's not guaranteed to work with vista.vim.
#
$ git clone https://github.com/universal-ctags/ctags.git --depth=1
$ cd ctags
$ ./autogen.sh
$ ./configure
$ make
$ sudo make install
```
o node.js 10.12 o superior (https://www.digitalocean.com/community/tutorials/como-instalar-node-js-en-ubuntu-18-04-es) \
o ccls (para C++):
>Build;
 ```sh
 cd
 git clone --depth=1 --recursive https://github.com/MaskRay/ccls
 cd ccls
 wget -c http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
 tar xf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
 cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$PWD/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04
 cmake --build Release
 ```
>Install;
 ```sh
 (sudo) cmake --build Release --target install
 ```
o Ripgrep (recomendado)

### El corrector ortográfico
https://www.atareao.es/tutorial/vim/el-corrector-ortografico-en-vim/
```sh
mkdir -p ~/.vim/spell
cd ~/.vim/spell
wget http://ftp.vim.org/vim/runtime/spell/es.latin1.spl
wget http://ftp.vim.org/vim/runtime/spell/es.latin1.sug
wget http://ftp.vim.org/vim/runtime/spell/es.utf-8.spl
wget http://ftp.vim.org/vim/runtime/spell/es.utf-8.sug
```

Algun font de Nerdfonts

Se recomienda para desarrollo en C++:\
Cppcheck\
clang-tidy\
cmake
