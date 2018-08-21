#!/usr/bin/env bash

for d in */; do

    echo
    # Will print */ if no directories are available
    echo $d
    cd $d

    git checkout master
    git stash
    
    git fetch
    git status

    read -p "Should i pull changes ? " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        git pull
    fi

    cd ..

done

