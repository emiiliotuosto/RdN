NOTES = main
t = main
c = "checkpoint"
SOLUT = solutions
LATEX = latexmk -latex="pdflatex" --shell-escape
#MKIDX = makeindex
BIBTEX = bibtex
SUBDIR = .
PDFotp = -sPAPERSIZE=a4
title = book
host := $(shell hostname -s)
wdir = $(if $(filter em-dell, $(host)), et52@pc1299.mcs.le.ac.uk:/var/cscampus/teaching/resources/CO7205/,/var/cscampus/teaching/resources/CO7205/)
CP = $(if $(filter em-dell, $(host)), scp, cp)
#web = $(if $(filter em-dell, $(host)), et52@pc1299.mcs.le.ac.uk:$(wdir), $(wdir))

all:
	$(LATEX) $(NOTES).tex

bib:
	$(BIBTEX) $(NOTES)

clean:          
	rm -f *~ *.log *.aux *.out

e:
	 emacs --reverse -T $(title) -mm $(t).tex &

