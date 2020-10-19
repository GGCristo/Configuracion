#! /bin/bash

# Description:
#   Compile a full-featured Vim from source on Ubuntu/Debian distros. Based
#   entirely on
#   https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
#
# Use:
#   ./compile_full_vim.sh

main(){
	echo "y" | sudo apt-get remove \
		vim \
		vim-runtime \
		gvim \
		vim-tiny \
		vim-common \
    vim-nox
	echo "y" | sudo apt-get install \
		libncurses5-dev \
		libgnome2-dev \
		libgnomeui-dev \
		libgtk2.0-dev \
		libatk1.0-dev \
		libbonoboui2-dev \
		libcairo2-dev \
		libx11-dev \
		libxpm-dev \
		libxt-dev \
		python-dev ruby-dev \
    python2-dev \
    python3-dev \
		git

	cd ~
	git clone https://github.com/vim/vim.git
	cd vim
	./configure --with-features=huge \
		--enable-multibyte \
		--enable-rubyinterp=yes \
    --enable-python3interp=yes \
    --with-python3-config-dir=/usr/lib/python3.8/config-3.8-x86_64-linux-gnu \
		--enable-perlinterp=yes \
		--enable-luainterp=yes \
		--enable-cscope \
    --enable-gui=auto \
		--prefix=/usr
	make VIMRUNTIMEDIR=/usr/share/vim/vim82
	sudo make install
}

main
