TEXSRC = gis-slides.tex
PDFOUT = $(TEXSRC:.tex=.pdf)
BBLFIL = $(TEXSRC:.tex=.bbl)
AUXFIL = $(TEXSRC:.tex=.cb) $(TEXSRC:.tex=.cb2) $(TEXSRC:.tex=.nav) $(TEXSRC:.tex=.snm)
LXMAKE = latexmk
LMOPTS = -pdf
LMSILE = -silent
LMFORC = -f -g
REMOVE = rm
RMOPTS = -fv

.PHONY: clean, cleanmost, cleanall, force, verbose

$(PDFOUT) : $(TEXSRC)
	$(LXMAKE) $(LMOPTS) $(LMSILE) $(TEXSRC)

force : $(TEXSRC)
	$(LXMAKE) $(LMOPTS) $(LMFORC) $(TEXSRC)

verbose : $(TEXSRC)
	$(LXMAKE) $(LMOPTS) $(TEXSRC)

clean :
	$(LXMAKE) -c
	@ $(REMOVE) $(RMOPTS) $(AUXFIL)

cleanmost :
	$(LXMAKE) -c
	@ $(REMOVE) $(RMOPTS) $(AUXFIL) $(BBLFIL)

# Watch the caps "-c" != "-C"

cleanall :
	$(LXMAKE) -C
	@ $(REMOVE) $(RMOPTS) $(AUXFIL) $(BBLFIL)
