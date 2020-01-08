#!/bin/bash

folders_to_save=(fontconfig i3 polybar)
config_files_to_save=(.xinitrc .Xresources)
REPOSITORY=$(echo ~/dotfiles)
CONFIG_FOLDER=$(echo ~/.config)
HOME_FOLDER=$(echo ~)

pushd $REPOSITORY

for folder in ${folders_to_save[@]}; do
    rm -rf $folder
done

for file in ${config_files_to_save[@]}; do
    rm -rf $file
done

pushd $CONFIG_FOLDER

for folder in ${folders_to_save[@]}; do
    cp -r $folder $REPOSITORY
done

pushd $HOME_FOLDER

for file in ${config_files_to_save[@]}; do
    cp $file $REPOSITORY
done

popd

popd

popd
