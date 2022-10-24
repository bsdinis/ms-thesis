.PHONY: all
all:
	pdflatex main

.PHONY: full
full:
	pdflatex main
	bibtex main
	pdflatex main
	pdflatex main

.PHONY: bib
bib:
	bibtex main

.PHONY: clean
clean:
	rm -f `ls main* | grep -v main.tex | grep -v main.bib`
