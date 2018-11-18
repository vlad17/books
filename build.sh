#!/bin/bash

if ! which pdflatex 2> /dev/null ; then
  sudo apt-get -y install texlive-latex-base texlive-fonts-recommended  texlive-fonts-extra
fi


cd book-of-why
for i in *.tex ; do
    echo compiling $i
    ARGUMENT="$i"
    AUXNAME="${ARGUMENT%.tex}.aux"
    pdflatex $i # -shell-escape -interaction=nonstopmode -file-line-error "$ARGUMENT" | grep -i ".*:[0-9]*:.*\|warning" 
    # bibtex -terse "$AUXNAME"  
    pdflatex -shell-escape -interaction=nonstopmode -file-line-error "$ARGUMENT" | grep -i ".*:[0-9]*:.*\|warning" 
done
cd -
