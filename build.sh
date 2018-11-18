#!/bin/bash

if ! which pdflatex 2> /dev/null ; then
    if which apt-get ; then
        echo installing pdflatex with sudo
        sudo apt-get -y install texlive-latex-base texlive-fonts-recommended  texlive-fonts-extra
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo josh figure this out
    else
        echo "dunno how to install pdflatex here, you figure it out"
    fi
fi


cd book-of-why
for i in *.tex ; do
    echo compiling $i
    ARGUMENT="$i"
    AUXNAME="${ARGUMENT%.tex}.aux"
    pdflatex -shell-escape -interaction=nonstopmode -file-line-error "$ARGUMENT" | grep -i ".*:[0-9]*:.*\|warning" 
    # bibtex -terse "$AUXNAME"  
    pdflatex -shell-escape -interaction=nonstopmode -file-line-error "$ARGUMENT" | grep -i ".*:[0-9]*:.*\|warning" 
done
cd -
