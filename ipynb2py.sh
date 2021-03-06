
#!/bin/bash

## Usage ################################
# ./ipynb2py <file-name without extension>
# Example:
# ipynb2py notebooks/neural_networks/rnn
#########################################
if [ $# -ne "1" ]; then
    echo "Usage: $0 <file-name without extension>"
else
    if [ ! -f $1.ipynb ]; then
	    echo "No existed $1.ipynb"
	    exit 1
    fi
    cp $1.ipynb $1.tmp.ipynb
    sed -i 's/%%/#/' $1.tmp.ipynb
    sed -i 's/%pylab/#/' $1.tmp.ipynb

    jupyter nbconvert --to script $1.tmp.ipynb 

    mv $1.tmp.py $1.py
    sed -i '1i# -*- coding: utf-8 -*-' $1.py
    sed -i '#!/usr/bin/python' $1.py
    rm $1.tmp.ipynb
fi 
