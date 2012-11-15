#!/bin/sh
if ![ -d ~/.vim/bundle ]; then mkdir ~/.vim/bundle; fi
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
