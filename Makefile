PDF = $(TEXMAIN:.tex=.pdf)
AUX = $(TEXMAIN:.tex=.cb) $(TEXMAIN:.tex=.cb2)
BBL = $(TEXMAIN:.tex=.bbl)
TEXMAIN = gis-slides.tex
LM = latexmk
RM = rm
LMOPTS = -pdf
LMSILENT = -silent
LMFORCE = -f -g
RMOPTS = -fv

.PHONY: clean, cleanmost, cleanall, force, verbose

$(PDF) : $(TEXMAIN)
	$(LM) $(LMOPTS) $(LMSILENT) $(TEXMAIN)

force : $(TEXMAIN)
	$(LM) $(LMOPTS) $(LMFORCE) $(TEXMAIN)

verbose : $(TEXMAIN)
	$(LM) $(LMOPTS) $(TEXMAIN)

clean :
	$(LM) -c
	@ $(RM) $(RMOPTS) $(AUX)

cleanmost :
	$(LM) -c
	@ $(RM) $(RMOPTS) $(AUX) $(BBL)

# Watch the caps "-c" != "-C"

cleanall :
	$(LM) -C
	@ $(RM) $(RMOPTS) $(AUX) $(BBL)
