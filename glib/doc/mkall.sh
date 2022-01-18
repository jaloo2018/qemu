#!/bin/bash
# sudo apt install latexmk
cd glib-gtk-book/src/
latexmk -pdf main.tex
evince main.pdf
