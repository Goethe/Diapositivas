verbatimtex
%&latex
\documentclass{minimal}
\usepackage[spanish]{babel}
\usepackage[T1]{fontenc}
\usepackage{lucidabr}
\usepackage{textcomp, amssymb}
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



outputtemplate := "sensor.mps";
% ==================================================================
% Circuito de acondicionamiento del sensor de ultrasonidos
beginfig(4);
numeric a[], i, j, k, w, x[], y[];
picture d[], amp, arh, cap, pzt, r, blackdot, whitedot;
pen l[];
path p[], q[][];
transform t[][];
l0 = pencircle scaled 0.15u;
l1 = pencircle scaled 0.25u;
l2 = pencircle scaled 0.35u;
l3 = pencircle scaled 0.5u;
pickup l1;

% ··································································
% constantes
w = 3u;		% factor de escala
p0 = amplifier scaled 8w;
amp := image(
    fill p0 withpen l0 withcolor white;
    draw p0 withpen l2;
    label.top(btex $-$ etex, (w, -3w));
    label.bot(btex $+$ etex, (w, 3w));
    label(btex \textsc{ina155} etex, (3w, 0));
);
p1 = (-w/3, 0)--(w/3, 0)--(0, 2w/3)--cycle;	% arrowhead path
arh := image( fill p1; );
cap := image( draw capacitor scaled 2w withpen l2; );
p2 = fullcircle scaled (3u/4);
blackdot := image( fill p2 withpen l1; );
p3 = fullcircle scaled (3u/2);
whitedot := image(
    fill p3 withpen l0 withcolor white;
    draw p3 withpen l1;
);
pzt := image( draw loudspeaker scaled 2w withpen l2; );
r := image( draw resistor scaled 2w rotated 90 withpen l2; );
% ··································································
% divisor de tensión (empiezo por abajo)
draw (4.5w, 2w)--(4.5w, 4w);
draw (3w, 6w)--(3w, 4w)--(6w, 4w)--(6w, 7w - 0.2w);
draw (3w, 8w)--(3w, 12w);
draw (3w, 14w)--(3w, 16w);
draw (6w, 7w + 0.2w)--(6w, 10w);
draw (3w, 10w)--(13w, 10w);
draw arh yscaled -1 shifted (4.5w, 2w);
draw blackdot shifted (4.5w, 4w);
draw r shifted (3w, 7w);
draw cap shifted (6w, 7w);
draw blackdot shifted (3w, 10w);
draw blackdot shifted (6w, 10w);
draw r shifted (3w, 13w);
draw arh shifted (3w, 16w);
% ··································································
% etapa amplificadora (empiezo a la izquierda, arriba, termino con
% la red de realimentación y el amplificador)
draw (16w, 17w)--(12w, 17w)--(12w, 14w + 2w/3)--(11.5w, 14w + 2w/3);
draw (16w, 11w)--(12w, 11w)--(12w, 14w - 2w/3)--(11.5w, 14w - 2w/3);
draw pzt xscaled -1 shifted (9.5w, 14w);
draw (16w, 16w)--(15w, 16w)--(15w, 15w);
draw (16w, 12w)--(15w, 12w)--(15w, 13w);
draw r shifted (15w, 14w);
draw (18w, 19w)--(18w, 9w);
draw arh shifted (18w, 19w);
draw arh yscaled -1 shifted (18w, 9w);
draw (20w, 14w)--(32w, 14w);
draw whitedot shifted (32w, 14w);
draw (13w, 11w)--(13w, 4.5w)--(14w, 4.5w);
draw (16w, 6w)--(14w, 6w)--(14w, 3w)--(17w - 0.2w, 3w);
draw (18w, 6w)--(20w, 6w)--(20w, 3w)--(17w + 0.2w, 3w);
draw (20w, 4.5w)--(21w, 4.5w)--(21w, 14w);
draw r rotated 90 shifted (17w, 6w);
draw cap rotated 90 shifted (17w, 3w);
draw blackdot shifted (13w, 11w);
draw blackdot shifted (13w, 10w);
draw blackdot shifted (14w, 4.5w);
draw blackdot shifted (20w, 4.5w);
draw amp shifted (16w, 14w);
% ··································································
% impedancia de entrada de la tarjeta de adquisición y final
draw (26.5w, 14w)--(26.5w, 12w);
draw (25w, 10w)--(25w, 12w)--(28w, 12w)--(28w, 9w + 0.2w);
draw (25w, 8w)--(25w, 6w)--(28w, 6w)--(28w, 9w - 0.2w);
draw (26.5w, 6w)--(26.5w, 4w);
draw r shifted (25w, 9w);
draw cap shifted (28w, 9w);
draw blackdot shifted (26.5w, 12w);
draw blackdot shifted (26.5w, 6w);
draw (32w, 10w)--(32w, 8w);
drawgisarrow (33w, 10w)--(33w, 14w);
draw whitedot shifted (32w, 10w);
draw arh yscaled -1 shifted (26.5w, 4w);
draw arh yscaled -1 shifted (32w, 8w);
% ··································································
% etiquetas
label.lft (btex $R = 100$ k$\Omega$ etex, (2.5w, 13w));
label.lft (btex $R$ etex, (2.5w, 7w));
label.rt (btex $C$ etex, (6.75w, 7w));
label.top (btex $V^+_{CC}$ etex, (3w, 17.5w));
label.lft (btex $R_G$ etex, (14.75w, 14w));
label.lrt (btex $R$ etex, (18w, 5.5w));
label.lrt (btex $C = 100$ pF etex, (17.25w + 0.2w, 2.5w));
label.rt (btex $V^-_{CC} \simeq 0$ V etex, (5w, 2.5w));
label.lft (btex $V^-_{CC}$ etex, (17.75w, 8.5w));
label.rt (btex $V^+_{CC} \simeq 9$ V etex, (19w, 19.5w));
label.lrt (btex $V_{REF}$ etex, (21.25w, 12.75w));
% label.llft (btex $1$ M$\Omega$ etex, (24.75w, 7.75w));
% label.urt (btex $150$ pF etex, (28.25w, 9.25w + 0.2w));
label.rt (btex $V_{OUT}$ etex, (33.25w, 12w));
z0 = (26.5w, 4w);   z1 = (33w, 10w);	z10 = 2/3[z1, z0];
label.lrt (btex $V^-_{CC}$ etex, z10);

endfig;
% ==================================================================



outputtemplate := "actuador.mps";
% ==================================================================
% Circuito de acondicionamiento del actuador de ultrasonidos
beginfig(5);
numeric a[], i, j, k, w, x[], y[];
picture d[], arh, cap, neg, pzt, piswitch, r, timer, inverter,
    blackdot, whitedot;
pen l[];
path p[], q[][];
transform t[][];
l0 = pencircle scaled 0.15u;
l1 = pencircle scaled 0.25u;
l2 = pencircle scaled 0.35u;
l3 = pencircle scaled 0.5u;
pickup l1;

% ··································································
% constantes
w = 3u;					% factor de escala
p1 = (-w/3, 0)--(w/3, 0)--(0, 2w/3)--cycle;	% arrowhead path
arh := image( fill p1; );
cap := image( draw capacitor scaled 2w withpen l2; );
p2 = fullcircle scaled (3u/4);
blackdot := image( fill p2 withpen l1; );
p3 = fullcircle scaled (3u/2);
whitedot := image(
    fill p3 withpen l0 withcolor white;
    draw p3 withpen l1;
);
pzt := image( draw loudspeaker scaled 2w withpen l2; );
r := image( draw resistor scaled 2w rotated 90 withpen l2; );
timer = tlc( w );
piswitch = switchPI( 2w );
inverter = cdub( w );

% ··································································
% cableado (empiezo por la izquierda, arriba)
draw (7w, 20w)--(7w, 18w);
draw (5w, 16w)--(5w, 18w)--(9w, 18w)--(9w, 16w);
draw (5w, 14w)--(5w, 10w);
draw (5w, 8w)--(5w, 6w);
draw (9w, 14w)--(9w, 12w);
draw (5w, 12w)--(7w - 0.2w, 12w);
draw (7w + 0.2w, 12w)--(15w, 12w);
% primer temporizador
draw (15w, 8w)--(12w, 8w)--(12w, 19w)--(24w, 19w)--(24w, 14w)--
    (23w, 14w);
draw (19w, 19w)--(19w, 21w);
draw (24w, 15w)--(27w, 15w)--(27w, 14w);
draw (23w, 12w)--(24w, 12w)--(24w, 10w)--(23w, 10w);
draw (24w, 11w)--(27w, 11w);
draw (27w, 12w)--(27w, 4w + 0.2w);
draw (23w, 8w)--(24w, 8w)--(24w, 4w + 0.2w);
draw (24w, 4w - 0.2w)--(24w, 2w);
draw (19w, 2w)--(19w, 0);
draw (27w, 4w - 0.2w)--(27w, 2w)--(14w, 2w)--(14w, 14w)--(15w, 14w);
draw (15w, 10w)--(13w, 10w)--(13w, 17w)--(33w, 17w);
% segundo temporizador
draw (41w, 23w)--(42w, 23w)--(42w, 27w)--(46w, 27w)--(46w, 26w);
draw (44w, 27w)--(44w, 29w);
draw (41w, 21w)--(44w, 21w)--(44w, 23w)--(46w, 23w);
draw (46w, 24w)--(46w, 22w);
draw (41w, 19w)--(46w, 19w);
draw (43w, 19w)--(43w, 12w)--(30w, 12w)--(30w, 21w)--(33w, 21w);
draw (46w, 20w)--(46w, 10w + 0.2w);
draw (41w, 17w)--(42w, 17w)--(42w, 10w + 0.2w);
draw (37w, 8w)--(37w, 6w);
draw (42w, 10w - 0.2w)--(42w, 8w);
draw (46w, 10w - 0.2w)--(46w, 8w)--(32w, 8w)--(32w, 23w)--
    (33w, 23w);
draw (33w, 19w)--(31w, 19w)--(31w, 14w)--(53w, 14w);
% inversor y final
draw (53w, 6w)--(50w, 6w)--(50w, 21w)--(63w, 21w)--(63w, 14w)--
    (61w, 14w);
draw (53w, 18w)--(52w, 18w)--(52w, 22w)--(57w, 22w)--(57w, 24w);
draw (53w, 4w)--(52w, 4w)--(52w, 0);
draw (53w, 16w)--(50w, 16w);
draw (53w, 10w)--(50w, 10w);
draw (53w, 12w)--(51w, 12w)--(51w, w)--(66w - 0.2w, w);
draw (53w, 8w)--(51w, 8w);
draw (61w, 16w)--(62w, 16w)--(62w, 4w)--(61w, 4w);
draw (61w, 8w)--(62w, 8w);
draw (61w, 10w)--(64w, 10w)--(64w, 6w)--(61w, 6w);
draw (64w, 8w)--(66w - 0.2w, 8w);
draw (66w + 0.2w, w)--(68w, w)--(68w, 4.5w - 2w/3)--
    (69w, 4.5w - 2w/3);
draw (66w + 0.2w, 8w)--(68w, 8w)--(68w, 4.5w + 2w/3)--
    (69w, 4.5w + 2w/3);

% ··································································
% referencias de tensión (empiezo por la izquierda, abajo)
draw arh yscaled -1 shifted (5w, 6w);
draw arh shifted (7w, 20w);
draw arh yscaled -1 shifted (19w, 0);
draw arh shifted (19w, 21w);
draw arh yscaled -1 shifted (37w, 6w);
draw arh shifted (44w, 29w);
draw arh yscaled -1 shifted (52w, 0);
draw arh shifted (57w, 24w);

% ··································································
% nodos (empiezo por la izquierda)
draw blackdot shifted (5w, 12w);
draw blackdot shifted (7w, 18w);
draw blackdot shifted (9w, 12w);
draw blackdot shifted (5w, 12w);
draw blackdot shifted (19w, 19w);
draw blackdot shifted (19w, 2w);
draw blackdot shifted (24w, 2w);
draw blackdot shifted (24w, 11w);
draw blackdot shifted (24w, 15w);
draw blackdot shifted (27w, 11w);
draw blackdot shifted (37w, 8w);
draw blackdot shifted (42w, 8w);
draw blackdot shifted (43w, 19w);
draw blackdot shifted (46w, 19w);
draw blackdot shifted (46w, 23w);
draw blackdot shifted (44w, 27w);
draw blackdot shifted (50w, 16w);
draw blackdot shifted (50w, 10w);
draw blackdot shifted (51w, 8w);
draw blackdot shifted (62w, 8w);
draw blackdot shifted (64w, 8w);

% ··································································
% resistencias, condensadores y conmutadores (empiezo por la
% izquierda, abajo)
draw piswitch rotated 270 shifted (5w, 9w);
draw r shifted (5w, 15w);
draw r shifted (9w, 15w);
draw cap rotated 90 shifted (7w, 12w);
draw cap shifted (24w, 4w);
draw cap shifted (27w, 4w);
draw r shifted (27w, 13w);
draw cap shifted (42w, 10w);
draw cap shifted (46w, 10w);
draw r shifted (46w, 21w);
draw r shifted (46w, 25w);
draw cap rotated 90 shifted (66w, w);
draw cap rotated 90 shifted (66w, 8w);

% ··································································
% integrados y transductor (empiezo por la izquierda)
draw timer shifted (19w, 11w);
draw timer shifted (37w, 20w);
draw inverter shifted (57w, 11w);
draw pzt shifted (71w, 4.5w);

% ··································································
% etiquetas (empiezo por la izquierda)
label.rt( btex $R_1$ etex, (5.25w, 15w) );
label.bot( btex $V^-_{CC}$ etex, (5w, 5w) );
label.top( btex $V^+_{CC}$ etex, (7w, 21w) );
label.rt( btex $R_1$ etex, (9.25w, 15w) );
label.lrt( btex $47$ nF etex, (7.5w, 11.5w) );
label.lft( btex $C = 100$ nF etex, (23w, 4w) );
label.rt( btex $470$ pF etex, (28w, 4w) );
label.lft( btex $R_2$ etex, (26.75w, 13w) );
label.rt( btex $V^-_{CC} \simeq 0$ V etex, (19.5w, -0.5w) );
label.top( btex $V^+_{CC}$ etex, (19w, 22w) );
label.lft( btex $V^+_{CC} \simeq 9$ V etex, (43.5w, 29.25w) );
label.urt( btex $R_2 = 750$ k$\Omega$ etex, (46.25w, 25.25w) );
label.urt( btex $1$ M$\Omega$ etex, (46.25w, 21.25w) );
label.llft( btex $18$ pF etex, (46w, 9.625w) );
label.lft( btex $C$ etex, (41w, 10w) );
label.rt( btex $V^-_{CC}$ etex, (37.5w, 5.5w) );
label.rt( btex $V^+_{CC}$ etex, (57.5w, 24.5w) );
label.rt( btex $V^-_{CC}$ etex, (52.5w, -0.5w) );
label.top( btex $C$ etex, (66w, 9w) );
label.top( btex $C$ etex, (66w, 2w) );

endfig;
% ==================================================================



end
