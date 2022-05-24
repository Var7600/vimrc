#!/bin/bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs\
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#copy vimrc to ~/.vimrc and save old config to ~/.vimrc.save
mv ~/.vimrc ~/.vimrc.save
mv vimrc ~/.vimrc
