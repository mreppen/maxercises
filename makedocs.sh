#!/bin/bash

if [ $# -lt 1 ]
then
    x=$(ls -l *.tex | wc -l)
    if [ "$x" -eq "1" ]
    then
	tex=$(ls | grep .tex\$)
    else
	echo "There are multiple .tex files. Please specify which to use."
	echo "Usage: makdedocs.sh document.tex"
	exit 1
    fi
else
    tex=$1
fi

for i in {1..2}; do
    sed -e 's#\\begin{document}#\\turnONproblems\\turnOFFsolutions\\begin{document}#g' $tex | pdflatex --jobname ${tex%.tex};
done
mv ${tex%.tex}.pdf exercises.pdf
for i in {1..2}; do
    sed -e 's#\\begin{document}#\\turnOFFproblems\\turnONsolutions\\begin{document}#g' $tex | pdflatex --jobname ${tex%.tex};
done
mv ${tex%.tex}.pdf solutions.pdf
latexmk -pdf $tex
latexmk -c $tex
