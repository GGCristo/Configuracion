#!/bin/bash
cp ~/.bashrc .
cp ~/.zshrc .
cp -r ~/.config/kitty/ .config/
cp -r ~/.config/nvim/ .config/
rm -rf .config/nvim/plugin
