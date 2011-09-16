OBJMPS = sensor.mps actuador.mps
OBMPDF = $(OBJMPS:.mps=-mps.pdf)
OBJPDF = $(OBJMPS:.mps=.pdf)
PNGJPG = caja.jpg interior.jpg
LIBRAR = gis-slides.mp gis-slides-arr.mp
SOURCE = gis-slides-figures.mp
AUXFIL = *.log *.mpx mpxerr.tex
LXMAKE = latexmk
LMPDFO = -pdf
LMSILE = -silent
LMFORC = -f -g
MEPOST = mpost
METPDF = mptopdf
RENAME = renombra
RENOPT = -v 's/-mps//'
REMOVE = rm
RMOPTS = -fv

.PHONY: clean, cleanmost, cleanall, force, pictures, verbose

$(OBJPDF) : $(OBJMPS)
	$(METPDF) $(OBJMPS)
	$(RENAME) $(RENOPT) $(OBMPDF)

$(OBJMPS) : $(SOURCE) $(LIBRAR)
	$(MEPOST) $(SOURCE)

clean :
	@ $(REMOVE) $(RMOPTS) $(AUXFIL)

cleanmost :
	@ $(REMOVE) $(RMOPTS) $(AUXFIL) $(OBJMPS)

cleanall :
	@ $(REMOVE) $(RMOPTS) $(AUXFIL) $(OBJPDF) $(OBJMPS)
