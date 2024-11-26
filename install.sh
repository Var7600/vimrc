#!/bin/bash
#install vim & vim-runtime
sudo apt install vim vim-runtime -y

#download vim plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#copy vimrc to ~/.vimrc and save old config to ~/.vimrc.save
if [ -e ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc.save
fi

mv ./vimrc ~/.vimrc

#install plugins
vim -c 'PlugInstall'
