#!/bin/bash

if ! which pdflatex >/dev/null 2>/dev/null ; then
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
echo 'entering book-of-why/'
for i in *.tex ; do
    ARGUMENT="$i"
    echo "  compiling ${ARGUMENT} into ${ARGUMENT%.tex}.pdf"
    AUXNAME="${ARGUMENT%.tex}.aux"
    pdflatex -shell-escape -interaction=nonstopmode -file-line-error "$ARGUMENT" | grep -i ".*:[0-9]*:.*\|warning" >/dev/null 2>/dev/null
    bibtex -terse "$AUXNAME"
    pdflatex -shell-escape -interaction=nonstopmode -file-line-error "$ARGUMENT" | grep -i ".*:[0-9]*:.*\|warning" >/dev/null 2>/dev/null
    pdflatex -shell-escape -interaction=nonstopmode -file-line-error "$ARGUMENT" | grep -i ".*:[0-9]*:.*\|warning" 
done
echo 'going back up ..'
cd ..

cd high-output-management
echo 'entering high-output-management/'
for i in *.tex ; do
    ARGUMENT="$i"
    echo "  compiling ${ARGUMENT} into ${ARGUMENT%.tex}.pdf"
    AUXNAME="${ARGUMENT%.tex}.aux"
    pdflatex -shell-escape -interaction=nonstopmode -file-line-error "$ARGUMENT" | grep -i ".*:[0-9]*:.*\|warning" >/dev/null 2>/dev/null
    bibtex -terse "$AUXNAME"
    pdflatex -shell-escape -interaction=nonstopmode -file-line-error "$ARGUMENT" | grep -i ".*:[0-9]*:.*\|warning" >/dev/null 2>/dev/null
    pdflatex -shell-escape -interaction=nonstopmode -file-line-error "$ARGUMENT" | grep -i ".*:[0-9]*:.*\|warning" 
done
echo 'going back up ..'
cd ..
