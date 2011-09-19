verbatimtex
%&latex
\documentclass{minimal}
\usepackage[spanish]{babel}
\usepackage[T1]{fontenc}
\usepackage[altbullet]{lucidabr}
\usepackage{textcomp, amsfonts, amsmath, amssymb}
\begin{document}
\fontsize{11pt}{13.2pt}\selectfont
etex

newinternal u, v;
u := 1mm;
v := 10mm;

input boxes
input graph
input gis-slides-arr
input gis-slides

wi = 12v;
he01 = 9v;	he02 = 6.75v;

ahlength := 2u;	ahangle := 20;
ahinset := 5/100;
linejoin := mitered;
linecap := butt;

verbatimtex
\usefont{T1}{hls}{m}{n}\fontsize{11pt}{13.2pt}\selectfont
etex

init_numbers(btex{\usefont{T1}{hls}{m}{n}\fontsize{11pt}{13.2pt}\selectfont-}etex,
	btex{\usefont{T1}{hls}{m}{n}\fontsize{11pt}{13.2pt}\selectfont1}etex, 
	btex\usefont{T1}{hls}{m}{n}\fontsize{11pt}{13.2pt}\selectfont${\cdot}10$etex, 
	btex\usefont{T1}{hls}{m}{n}\fontsize{11pt}{13.2pt}\selectfont${}^-$etex, 
	btex\usefont{T1}{hls}{m}{n}\fontsize{11pt}{13.2pt}\selectfont${}^2$etex
	);



outputtemplate := "resultados.mps";
% ==================================================================
% Grafo que representa el desplazamiento en frecuencia frente a la
% velocidad de propagación
beginfig(1)
color beamerblue, beamerred, umhyellow, bblight, brlight, uylight;
numeric a, b;
path p[];
picture cuadrado, redondo, rombo;
pen l[];
l0 = pencircle scaled 0.15u;
l1 = pencircle scaled 0.25u;
l2 = pencircle scaled 0.35u;
l3 = pencircle scaled 0.5u;
a = 2u;
b = a * sqrt(2) / 2;
beamerblue = (51/255, 51/255, 179/255);
beamerred = (1, 0, 0);
umhyellow = (250/255, 177/255, 23/255);
bblight = (115/255, 115/255, 179/255);
brlight = (1, 128/255, 128/255);
uylight = (250/255, 240/255, 137/255);
p0 = (-b/2, -b/2)--(b/2, -b/2)--(b/2, b/2)--(-b/2, b/2)--cycle;
p1 = fullcircle scaled .85a;
p2 = (0, -a/2)--(a/2, 0)--(0, a/2)--(-a/2, 0)--cycle;
cuadrado := image(
    fill p0 withcolor brlight withpen l0;
    draw p0 withcolor beamerred withpen l2;
);
redondo := image(
    fill p1 withcolor bblight withpen l0;
    draw p1 withcolor beamerblue withpen l2;
);
rombo := image (
    fill p2 withcolor uylight withpen l0;
    draw p2 withcolor umhyellow withpen l2;
);
pickup l1

    draw begingraph (5v, 47u);
	setrange (whatever,whatever , 1.5,whatever);
	begingroup
	    interim labeloffset := 4.5bp;
	    gdraw(0.51558, 24.90) plot cuadrado;
	    glabel.lrt(btex Pal1  etex, 1);
	    gdraw(0.73973, 20.30) plot cuadrado;
	    glabel.lrt(btex Pal2  etex, 1);
	    gdraw(0.50867, 18.10) plot cuadrado;
	    glabel.lrt(btex Pal3a etex, 1);
	    gdraw(0.98684, 28.70) plot redondo;
	    glabel.ulft(btex Pal3b etex, 1);
	    gdraw(0.85116, 1.91) plot redondo;
	    glabel.ulft(btex Palm  etex, 1);
	    gdraw(1.37410, 32.25) plot rombo;
	    glabel.llft(btex Euc   etex, 1);
	    gdraw(1.33790, 3.83) plot rombo;
	    glabel.llft(btex Pin   etex, 1);
	    gdraw(1.37990, 5.75) plot rombo;
	    glabel.ulft(btex Pos   etex, 1);
	endgroup;
	begingroup;
	    interim labeloffset := 12pt;
	    glabel.bot(btex Velocidad de propagaci\'on (km/s) etex,
		    OUT) withcolor beamerblue;
	    glabel.lft(btex \begin{tabular}{c}Desplazamiento \\%
		en frecuencia (kHz)\end{tabular} etex, OUT)
		    withcolor beamerblue;
	endgroup;
	autogrid(otick.bot, otick.lft) withpen l3
		withcolor beamerblue;
	frame withpen l3 withcolor beamerblue;
    endgraph;
endfig;
% ==================================================================



outputtemplate := "scattering-eucalipto.mps";
% ==================================================================
% Grafo que muestra el comportamiento de la dispersión (eucalipto)
beginfig(2)
color beamerblue, beamerred, umhyellow, bblight, brlight, uylight;
pen l[];
l0 = pencircle scaled 0.15u;
l1 = pencircle scaled 0.25u;
l2 = pencircle scaled 0.35u;
l3 = pencircle scaled 0.5u;
beamerblue = (51/255, 51/255, 179/255);
beamerred = (1, 0, 0);
umhyellow = (250/255, 177/255, 23/255);
bblight = (115/255, 115/255, 179/255);
brlight = (1, 128/255, 128/255);
uylight = (250/255, 240/255, 137/255);

pickup l1

    draw begingraph (70u, 22u);
	setrange (-0.004,-0.06 , 0.032,0.06);
	gdraw "euc02rx4-1.d" withcolor beamerred withpen l0;
	gdraw "euc02rx4-2.d" withcolor beamerred withpen l0;
	gdraw "euc02rx4-3.d" withcolor beamerred withpen l0;
	begingroup
	    interim labeloffset := 12pt;
	    glabel.bot(btex t [s] etex, OUT) withcolor beamerblue;
	    glabel.lft(btex e(t) [V] etex, OUT) withcolor beamerblue;
	endgroup;
	otick.lft("%g", 0.04) withpen l3 withcolor beamerblue;
	otick.lft("%g", 0) withpen l3 withcolor beamerblue;
	otick.lft("%g", -0.04) withpen l3 withcolor beamerblue;
	autogrid(otick.bot,) withpen l3
		withcolor beamerblue;
	frame withpen l3 withcolor beamerblue;
    endgraph;
endfig;
% ==================================================================



outputtemplate := "scattering-palmera.mps";
% ==================================================================
% Grafo que muestra el comportamiento de la dispersión (palmera)
beginfig(3)
color beamerblue, beamerred, umhyellow, bblight, brlight, uylight;
pen l[];
l0 = pencircle scaled 0.15u;
l1 = pencircle scaled 0.25u;
l2 = pencircle scaled 0.35u;
l3 = pencircle scaled 0.5u;
beamerblue = (51/255, 51/255, 179/255);
beamerred = (1, 0, 0);
umhyellow = (250/255, 177/255, 23/255);
bblight = (115/255, 115/255, 179/255);
brlight = (1, 128/255, 128/255);
uylight = (250/255, 240/255, 137/255);

pickup l1

    draw begingraph (70u, 22u);
	setrange (-0.004,-0.06 , 0.032,0.06);
	gdraw "pal06rx2-1.d" withcolor beamerred withpen l0;
	gdraw "pal06rx2-2.d" withcolor beamerred withpen l0;
	gdraw "pal06rx2-3.d" withcolor beamerred withpen l0;
	begingroup
	    interim labeloffset := 12pt;
	    glabel.lft(btex p(t) [V] etex, OUT) withcolor beamerblue;
	endgroup;
	otick.lft("%g", 0.04) withpen l3 withcolor beamerblue;
	otick.lft("%g", 0) withpen l3 withcolor beamerblue;
	otick.lft("%g", -0.04) withpen l3 withcolor beamerblue;
	autogrid(otick.bot,) withpen l3
		withcolor beamerblue;
	frame withpen l3 withcolor beamerblue;
    endgraph;
endfig;
% ==================================================================



end
