BASENAME  = main
FILENAME  = the-art-of-computer-program-structure
OUTDIR    = $(CURDIR)/output
OUTFILE   = $(OUTDIR)/$(FILENAME).pdf

COMPILE   = pdflatex -output-directory=output/ -file-line-error \
            -jobname $(FILENAME) $(BASENAME)

default: compile
compile:
	@mkdir -p $(OUTDIR)
	$(COMPILE) && $(COMPILE)

bibtex: compile
	cd $(OUTDIR)
	bibtex $(OUTDIR)/$(FILENAME).aux
	cd $(CURDIR)

xview: compile
	xpdf $(OUTFILE)

osxview: compile
	open -a Preview $(OUTFILE)

print:
	cat $(OUTFILE) | ssh ask.diku.dk lpr -P s2a

clean:
	rm -r $(OUTDIR)

