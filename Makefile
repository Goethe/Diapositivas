TEXSRC = gis-slides.tex
PDFOUT = $(TEXSRC:.tex=.pdf)
PICPDF = sensor.pdf actuador.pdf
PNGJPG = caja.jpg interior.jpg
PICDIR = pictures/
PICTUX = $(addprefix $(PICDIR), $(PICPDF) $(PNGJPG))
BBLFIL = $(TEXSRC:.tex=.bbl)
AUXFIL = $(TEXSRC:.tex=.cb) $(TEXSRC:.tex=.cb2) $(TEXSRC:.tex=.nav) $(TEXSRC:.tex=.snm)
LXMAKE = latexmk
LMOPTS = -pdf
LMSILE = -silent
LMFORC = -f -g
REMOVE = rm
RMOPTS = -fv
MAKEOP = -C

.PHONY: clean, cleanmost, cleanall, force, verbose

$(PDFOUT) : $(TEXSRC) $(PICTUX)
	$(LXMAKE) $(LMOPTS) $(LMSILE) $(TEXSRC)

$(PICTUX) :
	$(MAKE) $(MAKEOP) $(PICDIR)

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
